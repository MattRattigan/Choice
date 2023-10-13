import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  // collection reference
  final String? uid;
  DatabaseService({this.uid});

  final CollectionReference choiceCollection =
      FirebaseFirestore.instance.collection('user');

  Future updateUserData({String? firstName, String? lastName ,List<String>? favorites}) async {
    return await choiceCollection.doc(uid).set(
      {
        'FirstName': firstName,
        'LastName': lastName,
        'Favorites': favorites,
      },
    );
  }

  Stream<QuerySnapshot> get userData {
    return choiceCollection.snapshots();
  }
}
// choco@mail.com
// chocopassword