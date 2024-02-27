import 'package:equatable/equatable.dart';

class ErrorHandler extends Equatable implements Exception{

 const ErrorHandler(this.message, {this.code});
    final String message;
    final String? code;   

    String get getMessage{
        var error = message;

        switch (code){
            case 'invalid-email':
                error = 'Invalid email or does not match.';
            case 'wrong-password':
                error = 'The password you entered is wrong. Please Try again.';
            case 'weak-password':
                error = 'Weak password, add symbols to make it stronger';
            case 'user-not-found':
                error = 'The Email you entered does not exist. Please, Try again.';
            case 'user-disabled':
                error = 'Your account has been disabled.';
            case 'too-many-requests':
                error = 'Too many request, we have blocked you for sometime.';
            case 'operation-not-allowed':
                error = 'Auth is not enabled';
            case 'email-already-exists':
                error = 'Email already registered.';
          case 'invalid-credential':
            error = 'Invalid login credentials entered';
        }
        return error;
    }

  @override
  List<Object?> get props => [message];
}


class SuccessHandler<T> extends Equatable{

  const SuccessHandler(this.data, [this.message]);
  final T data;
  final String? message;

  @override
  List<Object?> get props => [data, message];
}
