import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_manager/features/auth/auth.dart';

class AuthService{
  AuthService._();

  ///create a single instance of this class that can be accessed through out the app
  static final instance = AuthService._();

  /// define an instance of FirebaseAuth to carry out Auth functions
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  ///Auth Functions
  User? get currentFirebaseUser => firebaseAuth.currentUser;

  Future<String?> reloadFirebaseUser() async{
    await firebaseAuth.currentUser?.reload();
    return currentFirebaseUser?.uid;
  }

  Future<Either<ErrorHandler, SuccessHandler<User>>> login(String email, String password)async{
      try{
        /// using the signInWithEmailAndPassword method to get the signin response
            final authResult = await firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password,);
              /// if the user object in the signin response is not null
              /// return the SuccessHandler with the user object
              if(authResult.user != null){
                return Right(SuccessHandler(authResult.user!));
              }else {
                ///Else return a signin error
                return const Left(ErrorHandler('Could not get user'));
              }
      }on FirebaseAuthException catch (e){
        ///Also catch the firebase exception error message and code through
        ///the error handler
        return Left(ErrorHandler(e.message?? '', code: e.code));
      }
  }

  Future<Either<ErrorHandler, SuccessHandler<User>>> signup(String email, String password)async{
      try{
            final authResult = await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password,);
              if(authResult.user != null){
                return Right(SuccessHandler(authResult.user!));
              }else {
                return const Left(ErrorHandler('Account creation failed'));
              }
      }on FirebaseAuthException catch (e){
        return Left(ErrorHandler(e.message?? '', code: e.code));
      }
  }

Future<Either<ErrorHandler, bool>> sendResetEmail(String email)async{
  try{
    await firebaseAuth.sendPasswordResetEmail(email: email);
    return const Right(true);
  }on FirebaseAuthException catch (e){
        return Left(ErrorHandler(e.message?? '', code: e.code));
      }
}

Future<Either<ErrorHandler, SuccessHandler<User>>> changePassword(
  String email, String oldPw, String newPw,
)async{
  try{
    final logIn = await login(email, oldPw);
    if(logIn.isRight){
      final user = logIn.right.data;
      await user.updatePassword(newPw);
      return Right(SuccessHandler(user));
    }else{
      final error = logIn.left;
      return Left(ErrorHandler(error.message, code: error.code));
    }
  }on FirebaseAuthException catch(e){
    return Left(ErrorHandler(e.message?? '', code: e.code));
  }

}

Future<Either<ErrorHandler, String>> sendResetPasswordLink(String email)async{
  try{
    await firebaseAuth.sendPasswordResetEmail(email: email);
    return Right('A mail containing the link to reset your password has been sent to $email');
  }on FirebaseAuthException catch(error){
    return Left(ErrorHandler(error.message?? '', code: error.code));
  }catch (e){
    return const Left(ErrorHandler("Oops! Something went wrong and your request couldn't be completed", 
    code: '500',),);
  }
}

Future<Either<ErrorHandler, bool>> signOut() async{
  try{
    await firebaseAuth.signOut();
    return const Right(true);
  }on FirebaseAuthException catch(e){
    return Left(ErrorHandler(e.message?? '', code: e.code));
  }
}

Future<void> deleteCurrentFirebaseUser()async{
  if(firebaseAuth.currentUser != null){
    await firebaseAuth.currentUser?.delete();
    await signOut();
  }
}



}