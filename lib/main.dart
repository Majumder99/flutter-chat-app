// ignore_for_file: unused_import, prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import "package:flutter/foundation.dart";
import "shared/Constant.dart";
import "pages/home_page.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: Constant.apiKey,
            appId: Constant.appId,
            messagingSenderId: Constant.messagingSenderId,
            projectId: Constant.projectId));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Chat App', debugShowCheckedModeBanner: false, home: HomePage());
  }
}
