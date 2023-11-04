import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:no_name_app/user_model/users.dart';

class LocalStorage {
  final _storage = const FlutterSecureStorage();

  Future<void> readFromStorage({required String key}) {
    return _storage.read(key: key);
  }

  Future<void> writeToStorage({required String key, required String value}) {
    return _storage.write(key: key, value: value);
  }

  Future<void> deleteFromStorage({required String key}) {
    return _storage.delete(key: key);
  }

  Future? deleteAllFromStorage({required String key}) {
    return _storage.deleteAll();
  }
}
