///storage service interface
abstract class HiveStorage{

  ///Initializes service
  Future<void>init();

  ///Removes item from storage
  Future<void> remove(String key);

  ///Retrieves item from storage with a key
  dynamic get(String key);

  ///Retrieves all items from storage
  dynamic getAll();

  ///Clears Storage
  Future<void>clear();

  ///Checks if an item exists in storage by a key
  bool has(String key);

  ///Sets an item data in storage by a key
  Future<void>set(String? key, dynamic data);

  ///Terminates service
  Future<void>close();


}
