import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:task_manager/features/features.dart';

class UserService {
  UserService({
    required FirebaseFirestore fireStore,
    required HiveStorageService storageService,
    required AuthService authService,
  })  : _fireStore = fireStore,
        _storageService = storageService,
        _authService = authService;

  final FirebaseFirestore _fireStore;
  final HiveStorageService _storageService;
  final AuthService _authService;

  Future<Either<ErrorHandler, NewUser>> getUserFromFireStore() async {
    try {
      // reload firebase user
      final userId = await _authService.reloadFirebaseUser();

      // get current user from fireStore
      final userDocRef =
          _fireStore.collection(FirebaseConstants.users.name).doc(userId);
      final doc = await userDocRef.get();
      final data = doc.data();

      //to save [data] to local storage we convert it to a json string using jsonencode

      //convert timestamp to a json serizable format
      final jsonData = data!.map((String key, dynamic value) {
        if (value is Timestamp) {
          return MapEntry(key, value.toDate().toIso8601String());
        }
        return MapEntry(key, value);
      });

      final encoded = jsonEncode(jsonData);

      print(encoded);

      await _storageService.set(StorageKey.userProfile.name, encoded);

//WIP: debugging timestamp issue
//find a way to json encode and decode time stamp
      final result =
          await _storageService.get(StorageKey.userProfile.name) as String;
      print('here: $result');
      //final decoded = jsonDecode(result) as Map<String, dynamic>;
      //print('DECODED:$decoded');
      final here = NewUser.fromJson(result);
      print('newuser: $here');
//////////////////////////////////////////////

      return Right(NewUser.fromMap(data));
    } catch (e) {
      // catch error
      return Left(ErrorHandler(e.toString()));
    }
  }

  Future<Either<ErrorHandler, NewUser>> getStoredUser(String key) async {
    try {
      final result = await _storageService.get(key) as String;
      final decoded = jsonDecode(result) as String?;
      if (decoded == null) {
        return const Right(NewUser());
      } else {
        return Right(NewUser.fromJson(decoded));
      }
    } catch (e) {
      return Left(ErrorHandler(e.toString()));
    }
  }
}
