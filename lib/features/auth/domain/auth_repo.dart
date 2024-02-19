import 'package:either_dart/either.dart';
import 'package:task_manager/features/auth/auth.dart';

abstract class AuthRepository{
  Future<Either<ErrorHandler, NewUser>>createNewUser(String email, String password, String fullName);
  Future<Either<ErrorHandler, NewUser>>signInWithSocials(SocialLogIn provider);
  Future<Either<ErrorHandler, NewUser>>logInUser(String email, String password);
}


class AuthRepoImpl implements AuthRepository{
  final _authService = AuthService.instance;

  @override
  Future<Either<ErrorHandler, NewUser>> createNewUser(String email, String password, String fullName) {
    return _authService.registerUser(email, password, fullName);
  }

  @override
  Future<Either<ErrorHandler, NewUser>> signInWithSocials(SocialLogIn provider) {
    return _authService.signInWithSocials(provider);
  }

  @override
  Future<Either<ErrorHandler, NewUser>> logInUser(String email, String password) {
    // TODO: implement logInUser
    throw UnimplementedError();
  }

}
