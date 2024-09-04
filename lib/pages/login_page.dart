import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tripdo/pages/controller_page.dart';
import 'package:tripdo/pages/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool showingError = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() {
    // - attempt to login
    // - navigate (replace) to homepage if it works
    // - show an error message if it doesn't

    bool result = Random().nextInt(10) > -1;

    if (result) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ControllerPage())
      );
    } else {
      setState(() {
        showingError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.surface,
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment:  CrossAxisAlignment.center,
          children: [
            const Text(
              'Group checklists for travel planning!',
              style: TextStyle(fontSize: 16.0),
            ),
            Column(
              children: [
                Image.asset(
                  'assets/icon.jpg',
                  width: 72.0,
                  height: 72.0,
                ),
                const SizedBox(height: 8.0),
                const Text(
                  'Trip-Do',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 5.0,
                  ),
                ),
              ]
            ),
            Column(
              children: [
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'email',
                  ),
                ),
                const SizedBox(height: 8.0),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'password',
                  ),
                ),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SignupPage())
                        );
                      },
                    ),
                    const Text('- OR -'),
                    ElevatedButton(
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                      onPressed: () => login(),
                    ),
                  ],
                ),
              ],
            ),
            Visibility(
              visible: showingError,
              child: const Text(
                'Something went wrong, unable to login at the moment',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}