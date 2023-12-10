import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_manager/app/storage/hive_storage/hive_storage.dart';

class HiveStorageService implements HiveStorage{
  //define a hive box
  late Box<dynamic>hiveBox;

  //Opens hive box by it's name
  Future<void>openHiveBox(String boxName)async{
    hiveBox = await Hive.openBox<dynamic>(boxName);
  }

  @override
  Future<void> clear() {
    // TODO: implement clear
    throw UnimplementedError();
  }

  @override
  Future<void> close() {
    // TODO: implement close
    throw UnimplementedError();
  }

  @override
  dynamic get(String key) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  dynamic getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  bool has(String key) {
    // TODO: implement has
    throw UnimplementedError();
  }

  @override
  Future<void> init() {
    // TODO: implement init
    throw UnimplementedError();
  }

  @override
  Future<void> remove(String key) {
    // TODO: implement remove
    throw UnimplementedError();
  }

  @override
  Future<void> set(String? key, data) {
    // TODO: implement set
    throw UnimplementedError();
  }

}