import 'package:hive_flutter/hive_flutter.dart';

class HiveStorageService{
  HiveStorageService._privateConstructor();

  static final HiveStorageService _instance = HiveStorageService._privateConstructor();
  static HiveStorageService get instance => _instance;

  //define a hive box
  late Box<dynamic>hiveBox;

  //Opens hive box by it's name
  Future<void>openHiveBox(String boxName)async{
    hiveBox = await Hive.openBox<dynamic>(boxName);
  }

  Future<void> openAppBox([String boxName = 'TASK_MANAGER']) async {
    hiveBox = await Hive.openBox<dynamic>(boxName);
  }

  Future<void> init() async{
    await openAppBox();
  }


  Future<void> clear() async{
    await hiveBox.clear();
  }

  Future<void> close() async{
    await hiveBox.close();
  }


  dynamic get(String key) {
    return hiveBox.get(key);
  }

  dynamic getAll() {
    return hiveBox.values.toList();
  }


  bool has(String key) {
    return hiveBox.containsKey(key);
  }

  Future<void> remove(String key) async{
    await hiveBox.delete(key);
  }

  Future<void> set(String? key, dynamic data) async{
    await hiveBox.put(key, data);
  }

  dynamic add(List<dynamic> value) async{
    await hiveBox.add(value);
  }

}

enum StorageKey{
  firebaseIdToken
}
