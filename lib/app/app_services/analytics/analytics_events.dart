class SignUpEvents{
  static const String accountCreation = 'account_creation';

  //sign up steps
  static const String signupStart = 'signup_start';

  static const String sentVerificationEmail = 'sent_verification_email';
  static const String emailVerificationSuccessful = 'verified_email';

  static const String signupComplete = 'signup_complete';
  static const String signupFailed = 'signup_failed';

}

class LoginEvents{
  static const String accountLogin = 'account_login';

  //log in steps
  static const String loginStart = 'login_start';

  static const String loginComplete = 'login_complete';
  static const String loginFailed = 'login_failed';
}
