// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:task_manager/app/app.dart';
import 'package:task_manager/app/app_services/analytics/analytics_events.dart';
import 'package:task_manager/features/auth/auth.dart';
import 'package:the_apple_sign_in/the_apple_sign_in.dart';

enum SocialLogIn { apple, google }

class AuthService {
  AuthService({
    required FirebaseAuth firebaseAuth,
    required FirebaseFirestore fireStore,
    required HiveStorageService storageService,
  })  : _firebaseAuth = firebaseAuth,
        _fireStore = fireStore,
        _storageService = storageService;

  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _fireStore;
  final HiveStorageService _storageService;

  ///=======> User Auth state Functions
  User? get currentFirebaseUser => _firebaseAuth.currentUser;

  Future<String?> reloadFirebaseUser() async {
    await _firebaseAuth.currentUser?.reload();
    return currentFirebaseUser?.uid;
  }

  Stream<User?> authStateChanges() {
    return _firebaseAuth.authStateChanges();
  }

  Future<Either<ErrorHandler, NewUser>> getUserFromDB(String uid) async {
    try {
      final userSnapshot = await _fireStore.collection(uid).doc(uid).get();
      if (userSnapshot.exists) {
        final user = NewUser.fromMap(userSnapshot.data()!);
        BaseUtils.basicPrint(user.uid);
        return Right(user);
      } else {
        return const Left(ErrorHandler('Failed to get User'));
      }
    } catch (e) {
      return Left(ErrorHandler('$e'));
    }
  }

  Future<void> saveToLocalStorage(String key, dynamic value) async {
    // ignore: avoid_dynamic_calls
    final jsonData = value.map((String key, dynamic value) {
      if (value is Timestamp) {
        return MapEntry(key, value.toDate().toIso8601String());
      }
      return MapEntry(key, value);
    });

    final encoded = json.encode(jsonData);
    await _storageService.set(key, encoded);
  }

  ///=========> Auth Functions

  Future<Either<ErrorHandler, SuccessHandler<User>>> signup(
    String email,
    String password,
  ) async {
    try {
      final authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (authResult.user != null) {
        return Right(SuccessHandler(authResult.user!));
      } else {
        return const Left(ErrorHandler('Account creation failed'));
      }
    } on FirebaseAuthException catch (e) {
      return Left(ErrorHandler(e.message ?? '', code: e.code));
    }
  }

  Future<Either<ErrorHandler, NewUser>> registerUser(
    String email,
    String password,
    String fullName,
  ) async {
    try {
      final createUser = await signup(email, password);
      if (createUser.isRight) {
        final firebaseUser = createUser.right.data;
        //define a user object and pass in the values
        //from the auth successful response
        final user = NewUser(
          uid: firebaseUser.uid,
          fullName: fullName,
          avatar: '',
          email: email,
          token: '',
          isEmailVerified: firebaseUser.emailVerified,
          createdAt: Timestamp.now(),
          updatedAt: Timestamp.now(),
        );
        // Pass this to the 'to Map'
        final data = user.toMap();

        final userDoc = _fireStore.collection(user.uid!).doc(user.uid);
        //set data to fireStore
        await userDoc.set(data);
        //check if data has been saved successfully
        final registeredUser = await getUserFromDB(user.uid!);

        //send verify email token
        final sendToken = await sendEmailVerificationToken();
        if (sendToken.isRight) {
          SuccessHandler(sendToken.right.data);
        } else {
          ErrorHandler(sendToken.left.message);
        }

        SharedPrefManager.isFirstLaunch = false;

        // save user details to local storage
        await saveToLocalStorage(StorageKey.userprofile.name, user);

        print(registeredUser.right);

        if (registeredUser.isRight) {
          return Right(registeredUser.right);
        } else {
          return Left(registeredUser.left);
        }
      } else {
        return Left(
          ErrorHandler(createUser.left.message, code: createUser.left.code),
        );
      }
    } catch (e) {
      return Left(ErrorHandler('$e'));
    }
  }

  Future<Either<ErrorHandler, Map<String, dynamic>>> signInWithGoogle() async {
    try {
      final googleSignIn = GoogleSignIn();

      final googleSignInAccount = await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final authCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        final userCredential =
            await _firebaseAuth.signInWithCredential(authCredential);
        return Right({
          'credential': userCredential,
          'userData': {
            'displayName': userCredential.user!.displayName,
            'email': userCredential.user!.email,
            'photoUrl': userCredential.user!.photoURL,
            'uid': userCredential.user!.uid,
          },
        });
      } else {
        return const Left(
          ErrorHandler('Error signing in!'),
        );
      }
    } on FirebaseAuthException catch (e) {
      return Left(ErrorHandler(e.message ?? '', code: e.code));
    }
  }

  Future<Either<ErrorHandler, Map<String, dynamic>>> signInWithApple() async {
    final authResponse = await TheAppleSignIn.performRequests(
      [
        const AppleIdRequest(requestedScopes: [Scope.email, Scope.fullName]),
      ],
    );

    switch (authResponse.status) {
      case AuthorizationStatus.authorized:
        final AppleIdCredential = authResponse.credential!;
        final oAuthCredential = OAuthProvider('apple.com');
        final credential = oAuthCredential.credential(
          idToken: String.fromCharCodes(AppleIdCredential.identityToken!),
        );
        final userCredential =
            await _firebaseAuth.signInWithCredential(credential);
        return Right({
          'credential': userCredential,
          'userData': {
            'displayName': userCredential.user!.displayName,
            'email': userCredential.user!.email,
            'photoUrl': userCredential.user!.photoURL,
            'uid': userCredential.user!.uid,
          },
        });
      case AuthorizationStatus.error:
        return const Left(
          ErrorHandler('Error signing in!'),
        );
      case AuthorizationStatus.cancelled:
        return const Left(
          ErrorHandler('Action Cancelled by user'),
        );
    }
  }

  Future<Either<ErrorHandler, NewUser>> signInWithSocials(
    SocialLogIn provider,
  ) async {
    Either<ErrorHandler, Map<String, dynamic>>? signIn;
    if (provider == SocialLogIn.apple) {
      signIn = await signInWithApple();
    } else if (provider == SocialLogIn.google) {
      signIn = await signInWithGoogle();
    }
    try {
      if (signIn != null && signIn.isRight) {
        final userData = signIn.right['userData'] as Map<String, dynamic>;
        final credential = signIn.right['credential'] as UserCredential;
        final firebaseUser = credential.user!;
        final email = userData['email'] ?? '';
        final displayName = userData['displayName'] ?? '';

        final user = NewUser(
          uid: firebaseUser.uid,
          fullName: '$displayName',
          avatar: '',
          email: '$email',
          isEmailVerified: true,
          createdAt: Timestamp.now(),
          updatedAt: Timestamp.now(),
        );
        final data = user.toMap();
        final userDoc = _fireStore.collection(user.uid!).doc(user.uid);
        await userDoc.set(data);

        final getUser = await getUserFromDB(user.uid!);

        BaseUtils.log('Social signIn', '${getUser.right}');

        await Analytics.instance.logUserEvents(SignUpEvents.accountCreation, {
          'email': user.email,
          'method': provider.name,
          'registration_steps': 'social_verified',
        });
        SharedPrefManager.isFirstLaunch = false;

        // save user details to local storage
        await saveToLocalStorage(StorageKey.userprofile.name, user);

        if (getUser.isRight) {
          return Right(getUser.right);
        } else {
          return Left(getUser.left);
        }
      } else {
        return Left(
          ErrorHandler(signIn!.left.getMessage, code: signIn.left.code),
        );
      }
    } catch (e) {
      return Left(ErrorHandler('$e'));
    }
  }

  Future<Either<ErrorHandler, SuccessHandler<User>>> signIn(
    String email,
    String password,
  ) async {
    try {
      /// using the signInWithEmailAndPassword method to get the signin response
      final authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      /// if the user object in the signin response is not null
      /// return the SuccessHandler with the user object
      if (authResult.user != null) {
        return Right(SuccessHandler(authResult.user!));
      } else {
        ///Else return a signin error
        return const Left(ErrorHandler('Could not get user'));
      }
    } on FirebaseAuthException catch (e) {
      ///Also catch the firebase exception error message and code through
      ///the error handler
      return Left(ErrorHandler(e.message ?? '', code: e.code));
    }
  }

  Future<Either<ErrorHandler, NewUser>> logInUser(
    String email,
    String password,
  ) async {
    try {
      //signIn User
      final loginUser = await signIn(email, password);
      if (loginUser.isRight) {
        final user = await getUserFromDB(loginUser.right.data.uid);
        SharedPrefManager.isFirstLaunch = false;
        return Right(user.right);
      } else {
        return Left(
          ErrorHandler(loginUser.left.getMessage, code: loginUser.left.code),
        );
      }
    } catch (e) {
      return Left(ErrorHandler('$e'));
    }
  }

  Future<Either<ErrorHandler, bool>> logOut() async {
    try {
      await _firebaseAuth.signOut();
      SharedPrefManager.clear();
      await _storageService.clear();
      return const Right(true);
    } on FirebaseAuthException catch (e) {
      return Left(ErrorHandler(e.message ?? '', code: e.code));
    }
  }

  Future<void> deleteCurrentFirebaseUser() async {
    if (_firebaseAuth.currentUser != null) {
      await _firebaseAuth.currentUser?.delete();
      await logOut();
    }
  }

  ///============> Other Auth Functions
  Future<Either<ErrorHandler, SuccessHandler<String>>>
      sendEmailVerificationToken() async {
    final HttpService dioClient = DioService();
    final String id;

    try {
      //get Id token
      final idToken = await currentFirebaseUser?.getIdToken();
      print('idtoken: $idToken');

      //save id token to hive storage
      await _storageService.set(StorageKey.firebaseIdToken.name, idToken);

      //get user details
      if (_firebaseAuth.currentUser != null) {
        id = (await reloadFirebaseUser())!;
        print('userid: $id');
      } else {
        id = '';
      }

      // call api to send email verification token
      final url = AppConfig.instance;
      final res =
          await dioClient.request(url.verifyEmail + id, RequestMethod.get);

      if (res.statusCode == 200) {
        print(res.data);
        return Right(SuccessHandler(res.data.toString()));
      } else {
        return const Left(ErrorHandler('Error in email verification'));
      }
    } catch (e) {
      // catch error
      return Left(ErrorHandler(e.toString()));
    }
  }

  Future<Either<ErrorHandler, SuccessHandler<String>>>
      confirmEmailVerificationToken(String token) async {
    final id = (await reloadFirebaseUser())!;
    try {
      final userSnapshot = await _fireStore.collection(id).doc(id).get();
      final user = NewUser.fromMap(userSnapshot.data()!);
      BaseUtils.basicPrint(user.token);

      if (user.token == token) {
        //update fireStore
        final userDoc = _fireStore.collection(user.uid!).doc(user.uid);
        const isVerified = {
          'isEmailVerified': true,
        };
        await userDoc.update(isVerified);
        return const Right(SuccessHandler('Email Successfully verified'));
      } else {
        return const Left(ErrorHandler('Token Incorrect'));
      }
    } catch (e) {
      return Left(ErrorHandler('$e'));
    }
  }

  Future<Either<ErrorHandler, bool>> sendResetEmail(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return const Right(true);
    } on FirebaseAuthException catch (e) {
      return Left(ErrorHandler(e.message ?? '', code: e.code));
    }
  }

  Future<Either<ErrorHandler, SuccessHandler<User>>> changePassword(
    String email,
    String oldPw,
    String newPw,
  ) async {
    try {
      final logIn = await signIn(email, oldPw);
      if (logIn.isRight) {
        final user = logIn.right.data;
        await user.updatePassword(newPw);
        return Right(SuccessHandler(user));
      } else {
        final error = logIn.left;
        return Left(ErrorHandler(error.message, code: error.code));
      }
    } on FirebaseAuthException catch (e) {
      return Left(ErrorHandler(e.message ?? '', code: e.code));
    }
  }

  Future<Either<ErrorHandler, String>> sendResetPasswordLink(
    String email,
  ) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return Right(
          'A mail containing the link to reset your password has been sent to $email');
    } on FirebaseAuthException catch (error) {
      return Left(ErrorHandler(error.message ?? '', code: error.code));
    } catch (e) {
      return const Left(
        ErrorHandler(
          "Oops! Something went wrong and your request couldn't be completed",
          code: '500',
        ),
      );
    }
  }
}
