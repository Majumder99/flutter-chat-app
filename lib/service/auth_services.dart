// ignore_for_file: unnecessary_null_comparison

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chat_app/helper/helper_function.dart';
import 'package:flutter_chat_app/service/database_services.dart';

// firebase e sign in register signout korar jnno
class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  //login

  Future loginUserWithEmailAndPassword(String email, String password) async {
    try {
      User user = (await firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user!;

      if (user != null) {
        return true;
      }
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      print(e);
      return e;
    }
  }

  //register

  Future registerUserWithEmailandPassword(
      String fullName, String email, String password) async {
    try {
      User user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;

      if (user != null) {
        await DatabaseServices(uid: user.uid).saveUserData(fullName, email);
        return true;
      }
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      print(e);
      return e;
    }
  }

  //signout
  Future signOut() async {
    try {
      await HelperFunctions.saveUserLoggedInStatus(false);
      await HelperFunctions.saveUserEmail("");
      await HelperFunctions.saveUserFullName("");
      await firebaseAuth.signOut();
    } catch (e) {
      return null;
    }
  }
}
