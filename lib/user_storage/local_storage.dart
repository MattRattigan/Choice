import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
  final storage = const FlutterSecureStorage();

  Future? readFromStroage({required String? key}) {
    return storage.read(key: key!);
  }

  Future? writeToStorage({required String? key, required dynamic value}) {
    // key is practically the label and value is the value of the variable
    // or whatever is specified

    return storage.write(key: key!, value: value);
  }

  Future? deleteFromStorage({required String? key}) {
    return storage.delete(key: key!);
  }

  Future? deleteAllFromStorage({required String key}) {
    return storage.deleteAll();
  }
}
