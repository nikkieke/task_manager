import 'package:either_dart/either.dart';
import 'package:task_manager/features/auth/auth.dart';

abstract class AuthRepository{
  Future<Either<ErrorHandler, NewUser>>createNewUser(String email, String password, String fullName);
  Future<Either<ErrorHandler, NewUser>>signInWithSocials(SocialLogIn provider);
  Future<Either<ErrorHandler, NewUser>>logInUser(String email, String password);
  Future<Either<ErrorHandler, bool>>logOut();
  Future<Either<ErrorHandler, SuccessHandler<String>>> sendVerifyEmailToken();
  Future<Either<ErrorHandler, SuccessHandler<String>>>confirmEmailVerificationToken(String token);
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
    return _authService.logInUser(email, password);
  }

  @override
  Future<Either<ErrorHandler, bool>> logOut() {
    return _authService.logOut();
  }

  @override
  Future<Either<ErrorHandler, SuccessHandler<String>>> sendVerifyEmailToken() {
   return _authService.sendEmailVerificationToken();
  }

  @override
  Future<Either<ErrorHandler, SuccessHandler<String>>> confirmEmailVerificationToken(String token) {
   return _authService.confirmEmailVerificationToken(token);
  }

}
