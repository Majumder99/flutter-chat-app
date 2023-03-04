// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';

// eita use korbo firebase e value set update delete korar jnno firebase e data pathanor jnno
class DatabaseServices {
  final String? uid;
  DatabaseServices({this.uid});

  //reference for our collection
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference groupCollection =
      FirebaseFirestore.instance.collection('groups');

  //saving the userdata
  Future saveUserData(String fullName, String email) async {
    return await userCollection.doc(uid).set({
      "fullName": fullName,
      "email": email,
      "groups": [],
      "profilePic": "",
      "uid": uid
    });
  }

//geting user data
  Future gettingUserData(String email) async {
    QuerySnapshot snapshot =
        await userCollection.where("email", isEqualTo: email).get();
    return snapshot;
  }
}
