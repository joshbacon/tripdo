import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tripdo/pages/controller_page.dart';
import 'package:tripdo/pages/login_page.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

  void checkAuthentication(BuildContext context) {
    bool loggedIn = Random().nextInt(10) > 100;

    if (loggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ControllerPage())
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage())
      );
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
      .addPostFrameCallback((_) => checkAuthentication(context));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Image.asset( // TODO: add an animation to this
          'assets/icon.jpg',
          width: 72.0,
          height: 72.0,
        ),
      ),
    );
  }
}