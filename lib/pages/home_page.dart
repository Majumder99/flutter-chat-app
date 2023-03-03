// ignore_for_file: unused_import
import "package:flutter/material.dart";
import "package:flutter_chat_app/pages/auth/login_page.dart";
import "package:flutter_chat_app/service/auth_services.dart";
import "package:flutter_chat_app/widgets/widgets.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("Logout"),
          onPressed: () {
            authService.singOut();
            nextScreen(context, const LoginPage());
          },
        ),
      ),
    );
  }
}
