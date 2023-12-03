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
            final authResult = await firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password,);
              if(authResult.user != null){
                return Right(SuccessHandler(authResult.user!));
              }else {
                return const Left(ErrorHandler('Could not get user'));
              }
      }on FirebaseAuthException catch (e){
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

}