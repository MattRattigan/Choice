import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:no_name_app/providers/choice_providers.dart';

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
}

mixin AuthInteraction {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final container = ProviderContainer();

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
