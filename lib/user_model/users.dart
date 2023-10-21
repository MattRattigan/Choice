// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';



class ChoiceUser {
  String? uid;
  ChoiceUser({
    this.uid,
  });

  factory ChoiceUser.fromFirebase(User? user) {
    if (user?.uid == null) {
      throw ChoiceUserCreation("\nError! User was not created");
    } else {
      return ChoiceUser(uid: user?.uid);
    }
  }

  ChoiceUser copyWith({
    String? uid,
  }) {
    return ChoiceUser(
      uid: uid ?? this.uid,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
    };
  }

  factory ChoiceUser.fromMap(Map<String, dynamic> map) {
    return ChoiceUser(
      uid: map['uid'] != null ? map['uid'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChoiceUser.fromJson(String source) {
    var decodedMap = json.decode(source);
    if (decodedMap is Map<String, dynamic>) {
        return ChoiceUser.fromMap(decodedMap);
    } else {
        throw const FormatException("Failed to decode user JSON to Map<String, dynamic>");
    }
}


  @override
  String toString() => 'ChoiceUser(uid: $uid)';

  @override
  bool operator ==(covariant ChoiceUser other) {
    if (identical(this, other)) return true;
  
    return 
      other.uid == uid;
  }

  @override
  int get hashCode => uid.hashCode;
}

class ChoiceUserCreation implements Exception {
  ChoiceUserCreation(this.message);
  final String? message;

  @override
  String toString() {
    return "$runtimeType: $message";
  }
}
