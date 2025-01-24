import 'package:flutter/material.dart';
import 'package:scan/ui/auth/login.dart';

class StartupView extends StatefulWidget {
  const StartupView({super.key});

  @override
  State<StartupView> createState() => _StartupViewState();
}

class _StartupViewState extends State<StartupView> {
  @override
  void initState() {
    super.initState();

    // Delay for 3 seconds and navigate to the login screen
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Login(username: "")),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(150.0),
          child: Image.asset(
            "assets/images/logo.png",
          ),
        ),
      ),
    );
  }
}

