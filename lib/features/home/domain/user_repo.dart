import 'package:either_dart/either.dart';
import 'package:task_manager/features/features.dart';

abstract class UserRepository{
  Future<Either<ErrorHandler, NewUser>>saveUserInfo();
  Future<Either<ErrorHandler, NewUser>>getUserInfo(String key);
}

class UserRepoImpl implements UserRepository{
  final _userService = UserService.instance;

  @override
  Future<Either<ErrorHandler, NewUser>> saveUserInfo() {
    return _userService.saveUserInfo();
  }

  @override
  Future<Either<ErrorHandler, NewUser>> getUserInfo(String key) {
    return _userService.getUserInfo(key);
  }
}