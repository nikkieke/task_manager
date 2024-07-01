import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:task_manager/features/features.dart';

class UserService{
  UserService._();

  static final instance = UserService._();

  final authService = AuthService.instance;

  final storageService = HiveStorageService.instance;

  Future<Either<ErrorHandler, NewUser>>saveUserInfo() async{

    try {
      // reload firebase user
      final userId = await authService.reloadFirebaseUser();

      // get current user from fireStore
      final userDocRef = authService.fireStore.collection(userId!).doc(userId);
      final doc = await userDocRef.get();
      final data = doc.data();

      // pass user data in new user model
      final user = NewUser.fromMap(data!);

      // save user name to local storage
      //await storageService.set(StorageKey.username.name, user.fullName);

      // return newUser
      return Right(user);
    }catch(e){
      // catch error
      return Left(ErrorHandler(e.toString()));
    }
  }

  Future<Either<ErrorHandler, NewUser>>getUserInfo(String key)async{
    try{
      final result = await storageService.get(key) as String;
      final decoded = jsonDecode(result) as String?;
      if(decoded == null){
        return const Right(NewUser());
      }else{
        return Right(NewUser.fromJson(decoded));
      }
    }catch (e){
      return Left(ErrorHandler(e.toString()));
    }
  }

}
