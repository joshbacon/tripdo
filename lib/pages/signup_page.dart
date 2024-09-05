import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  final FocusNode ctrlFocusNode = FocusNode();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool showingPassword = false;

  void handleSignup() {
    // TODO:
    // call the backend
    // - move to controller page if it works
    // - show an error message if it doesn't
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Signup'),
      ),
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Container(
          color: Colors.transparent, // Children widgets eat the onTap without this for some reason
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Column(
                children: [
                  Text(
                    'Create an account!',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'and start your trip today',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'username',
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'email',
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  TextField(
                    controller: passwordController,
                    obscureText: !showingPassword,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'password',
                      prefixIcon: IconButton(
                        icon: showingPassword ?
                          const Icon(Icons.password) :
                          const Icon(Icons.remove_red_eye),
                        onPressed: () {
                          setState(() {
                            showingPassword = !showingPassword;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 8.0,
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  shadowColor: Theme.of(context).colorScheme.primary,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Signup',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                onPressed: () => handleSignup(),
              ),
            ],
          ),
        ),
      )
    );
  }
}