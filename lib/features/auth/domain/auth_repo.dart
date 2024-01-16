import 'package:either_dart/either.dart';
import 'package:task_manager/features/auth/auth.dart';

abstract class AuthRepository{
  Future<Either<ErrorHandler, NewUser>>createNewUser(String email, String password, String fullName);
}


class AuthRepoImpl implements AuthRepository{
  final _authService = AuthService.instance;

  @override
  Future<Either<ErrorHandler, NewUser>> createNewUser(String email, String password, String fullName) {
    return _authService.registerUser(email, password, fullName);
  }

}