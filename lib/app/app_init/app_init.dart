import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:task_manager/app/app.dart';
import 'package:task_manager/app/storage/hive_storage/hive_storage.dart';

Future<void>initializeApp({required Flavor flavor})async{
  AppConfig.init(flavor);
  await SharedPrefManager.init();
  await Firebase.initializeApp();
  await Hive.initFlutter();

  final HiveStorage initializeStorageService = HiveStorageService();
  await initializeStorageService.init();
}
