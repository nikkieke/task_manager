import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_manager/app/storage/hive_storage/hive_storage.dart';

class HiveStorageService implements HiveStorage{
  //define a hive box
  late Box<dynamic>hiveBox;

  //Opens hive box by it's name
  Future<void>openHiveBox(String boxName)async{
    hiveBox = await Hive.openBox<dynamic>(boxName);
  }

  Future<void> openAppBox([String boxName = 'TASK_MANAGER']) async {
    hiveBox = await Hive.openBox<dynamic>(boxName);
  }

  @override
  Future<void> init() async{
    await openAppBox();
  }

  @override
  Future<void> clear() async{
    await hiveBox.clear();
  }

  @override
  Future<void> close() async{
    await hiveBox.close();
  }

  @override
  dynamic get(String key) {
    return hiveBox.get(key);
  }

  @override
  dynamic getAll() {
    return hiveBox.values.toList();
  }

  @override
  bool has(String key) {
    return hiveBox.containsKey(key);
  }

  @override
  Future<void> remove(String key) async{
    await hiveBox.delete(key);
  }

  @override
  Future<void> set(String? key, dynamic data) async{
    await hiveBox.put(key, data);
  }

  @override
  dynamic add(List<dynamic> value) async{
    await hiveBox.add(value);
  }

}

enum StorageKey{
  firebaseIdToken
}
