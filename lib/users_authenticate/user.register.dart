import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:no_name_app/user_model/users.dart';
import 'package:no_name_app/users_authenticate/user_anonymous.dart';
import 'package:no_name_app/users_firestore/user_firestore.dart';

class ChoiceRegister with AuthInteraction {
  Future<ChoiceUser?> registerWithEmailAndPassword(
      {String? email, String? password}) async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
          email: email!, password: password!);
      await DatabaseService(uid: result.user!.uid)
          .updateUserData(firstName: null, lastName: null, favorites: null);
      return ChoiceUser.fromFirebase(result.user);
    } on ChoiceUserCreation catch (e) {
      print(e.toString());
      return null;
    }
  }
}




  // // register with email & password
  // Future<ChoiceUser?> registerWithEmailAndPassword(
  //     {String? email, String? password}) async {
  //   try {
  //     UserCredential result = await _auth.createUserWithEmailAndPassword(
  //         email: email!, password: password!);
  //     User? user = result.user;
  //     // create a new document for the user with the uid
  //     await DatabaseService(uid: user!.uid).updateUserData(firstName: 'Mario', lastName: 'Mario',);
  //     return _userFromFirebaseUser(user);
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }