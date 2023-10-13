import 'package:firebase_auth/firebase_auth.dart';
import 'package:no_name_app/user_model/users.dart';
import 'package:no_name_app/users_authenticate/user_anonymous.dart';

class ChoiceSignIn with AuthInteraction {
  Future<ChoiceUser?> signInWithEmailAndPassword(
      {String? email, String? password}) async {
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(
          email: email!, password: password!);
      return ChoiceUser.fromFirebase(result.user);
    } on ChoiceUserCreation catch (e) {
      print(e.toString());
      return null;
    }
  }
}
