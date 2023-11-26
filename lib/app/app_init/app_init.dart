import 'package:task_manager/app/app.dart';

Future<void>initializeApp({required Flavor flavor})async{
  AppConfig.init(flavor);
  await SharedPrefManager.init();
}
