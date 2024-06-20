import 'package:task_manager/app/app.dart';

enum Flavor{dev, prod}

class AppConfig{

  AppConfig._privateConstructor(){
      if(_flavor == null){
        BaseUtils.log(
            'AppConfig',
            'Init has not been called',
          message: 'Call init to set the flavor, flavor set to dev by default',
        );
        _flavor = Flavor.dev;
      }
  }
  static final AppConfig _instance = AppConfig._privateConstructor();
  static AppConfig get instance => _instance;
  static Flavor? _flavor;

  //set Flavor
  static void init(Flavor flavor){
    _flavor = flavor;
  }

  static const baseUrl = 'https://taskmanager-icd4.onrender.com/api/';

  // verify email
String get verifyEmail => '/emailVerify/';

}
