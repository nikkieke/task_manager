import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:task_manager/features/features.dart';

class UserService{
  UserService._();

  static final instance = UserService._();

  final authService = AuthService.instance;


  Future<Either<ErrorHandler, NewUser>>getUserData() async{
    try {
      // reload firebase user
      final userId = await authService.reloadFirebaseUser();

      // get current user from firestore
      final userDocRef = authService.fireStore.collection(userId!).doc(userId);
      final doc = await userDocRef.get();
      final data = doc.data();

      // pass user data in new user model


      // save user name to local storage

      // return newUser
    }catch(e){

    }
  }

}
