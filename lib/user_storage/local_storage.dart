import 'package:firebase_auth/firebase_auth.dart';
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

  Future<void> deleteAllFromStorage() {
    return _storage.deleteAll();
  }

Future<void> saveUser(ChoiceUser choiceUser) async {
    final userJson = choiceUser.toJson(); // This should return a JSON string.
    await _storage.write(key: 'user', value: userJson);
}


  Future<ChoiceUser?> readUser() async {
    try {
      final userJson = await _storage.read(key: 'user');
      print('Raw User JSON: $userJson');
      if (userJson != null) {
        return ChoiceUser.fromJson(userJson);
      }
    } on ChoiceUserCreation catch (e) {
      print("\n${e.toString()}\n");
    } catch (e) {
      print("Error reading user: $e");
      rethrow;
    }
    return null;
  }

  // Future<UserCredential> convertToUser() async {
    
  // }
}