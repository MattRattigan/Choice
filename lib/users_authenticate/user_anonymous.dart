import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:no_name_app/providers/choice_providers.dart';
import 'package:no_name_app/user_storage/local_storage.dart';

class FirebaseAnonymousAuth with AuthInteraction {
  // Sign in anonymously
  Future? signInAnonymously() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      print('Signed in anonymously');
      return result.user;
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      switch (e.code) {
        case "operation-not-allowed":
          print("Anonymous auth hasn't been enabled for this project");
          break;
        default:
          print("Error Code: ${e.code} - ${e.message}");
      }
      print('\nWhat the fuck\n');
      return null;
    }
  }

  void anonToGoogleAuth() {
    // TODO: Incomplete requires google sign-in provider, location will be users_firestore directory
    String value = container.read(idTokenProvider);
    final credential = GoogleAuthProvider.credential(idToken: value);
    container.dispose();
  }

  // Future<void> anonToFirebaseUser() async {
  //   try {
  //     final userCredential = await FirebaseAuth.instance.currentUser
  //         ?.linkWithCredential(credential);
  //   } on FirebaseAuthException catch (e) {
  //     switch (e.code) {
  //       case "provider-already-linked":
  //         print("The provider has already been linked to the user.");
  //         break;
  //       case "invalid-credential":
  //         print("The provider's credential is not valid.");
  //         break;
  //       case "credential-already-in-use":
  //         print("The account corresponding to the credential already exists, "
  //             "or is already linked to a Firebase User.");
  //         break;
  //       // See the API reference for the full list of error codes.
  //       default:
  //         print("Unknown error.");
  //     }
  //   }
  // }
}

mixin AuthInteraction {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final container = ProviderContainer();
  final storage = LocalStorage();

  FirebaseAuth get auth => _auth;

  // Get current user
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
