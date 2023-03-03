// ignore_for_file: unused_import, prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import "package:flutter/foundation.dart";
import "package:flutter_chat_app/helper/helper_function.dart";
import "shared/Constant.dart";
import "pages/home_page.dart";
import 'pages/auth/login_page.dart';

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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  bool _isSignedIn = false;
  @override
  void initState() {
    super.initState();
    getUserLoggedInStatus();
  }

  //this is how we can check if someone is logged in or not

  getUserLoggedInStatus() async {
    await HelperFunctions.getUserLoggedInStatus().then((value) {
      if (value != null) {
        setState(() {
          _isSignedIn = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Chat App',
        theme: ThemeData(
            primaryColor: Constant().primaryColor,
            scaffoldBackgroundColor: Colors.white),
        debugShowCheckedModeBanner: false,
        home: _isSignedIn ? const HomePage() : const LoginPage());
  }
}
