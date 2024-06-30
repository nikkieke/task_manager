import 'package:either_dart/either.dart';
import 'package:task_manager/features/features.dart';

abstract class UserRepository{
  Future<Either<ErrorHandler, NewUser>>getUserData();
}

class UserRepoImpl implements UserRepository{
  final _userService = UserService.instance;

  @override
  Future<Either<ErrorHandler, NewUser>> getUserData() {
    return _userService.getUserData();
  }
}