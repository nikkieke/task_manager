import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:task_manager/app/app.dart';

Future<void>initializeApp({required Flavor flavor})async{
  AppConfig.init(flavor);
  await SharedPrefManager.init();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  final storageService = HiveStorageService.instance;
  await storageService.init();
}
