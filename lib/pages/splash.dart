import 'dart:async';
import 'package:flower_app/pages/login.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  static const String routeName = "splash";
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(
          seconds: 3,
        ), () {
      Navigator.pushReplacementNamed(context, Login.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/images/s.jpg",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
