import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefManager {
  static late SharedPreferences prefs;

  //init shared preferences
  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static set isFirstLaunch(bool isFirstLaunch) =>
      prefs.setBool('isFirstLaunch', isFirstLaunch);
  static bool get isFirstLaunch => prefs.getBool('isFirstLaunch') ?? true;

  static set isLoggedIn(bool isLoggedIn) =>
      prefs.setBool('isLoggedIn', isLoggedIn);
  static bool get isLoggedIn => prefs.getBool('isLoggedIn') ?? true;

  static set isEmailVerified(bool isEmailVerified) =>
      prefs.setBool('isEmailVerified', isEmailVerified);
  static bool get isEmailVerified => prefs.getBool('isEmailVerified') ?? true;

  static void clear() {
    prefs.clear();
    //SharedPrefManager.isFirstLaunch = false;
  }
}
