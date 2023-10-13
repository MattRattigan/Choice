import 'package:firebase_auth/firebase_auth.dart';

class ChoiceUser {
  String? uid;
  ChoiceUser({this.uid});

  factory ChoiceUser.fromFirebase(User? user) {
    if (user?.uid == null) {
      throw ChoiceUserCreation("\nError! User was not created");
    } else {
      return ChoiceUser(uid: user?.uid);
    }
  }
}

class ChoiceUserCreation implements Exception {
  ChoiceUserCreation(this.message);
  final String? message;
}
