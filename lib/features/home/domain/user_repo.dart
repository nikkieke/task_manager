import 'package:either_dart/either.dart';
import 'package:task_manager/features/features.dart';

abstract class UserRepository {
  Future<Either<ErrorHandler, NewUser>> getUserFromFireStore();
  Either<ErrorHandler, NewUser> getStoredUser(String key);
}

class UserRepoImpl implements UserRepository {
  UserRepoImpl(this._userService);

  final UserService _userService;

  @override
  Future<Either<ErrorHandler, NewUser>> getUserFromFireStore() {
    return _userService.getUserFromFireStore();
  }

  @override
  Either<ErrorHandler, NewUser> getStoredUser(String key) {
    return _userService.getStoredUser(key);
  }
}
