import 'package:either_dart/either.dart';
import 'package:task_manager/features/features.dart';

abstract class UserRepository {
  Future<Either<ErrorHandler, NewUser>> getUserFromFireStore();
  Future<Either<ErrorHandler, NewUser>> getStoredUser(String key);
}

class UserRepoImpl implements UserRepository {
  final _userService = UserService.instance;

  @override
  Future<Either<ErrorHandler, NewUser>> getUserFromFireStore() {
    return _userService.getUserFromFireStore();
  }

  @override
  Future<Either<ErrorHandler, NewUser>> getStoredUser(String key) {
    return _userService.getStoredUser(key);
  }
}
