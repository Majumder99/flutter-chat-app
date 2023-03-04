import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";

// common functions gulan eikhane thakbe

const textInputDecoration = InputDecoration(
  labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFFee7b64), width: 2.0),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFFee7b64), width: 2.0),
  ),
  //errorborder
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 2.0),
  ),
);

void nextScreen(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

void nextScreenReplacement(context, page) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => page));
}

//showssnackbar
void showSnackBar(BuildContext context, dynamic message, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message is FirebaseAuthException ? message.message! : message.toString(),
      style: const TextStyle(fontSize: 15),
    ),
    backgroundColor: color,
    duration: const Duration(seconds: 3),
  ));
}
