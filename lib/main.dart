import 'package:flutter/material.dart';
import 'package:tripdo/pages/loading_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trip-Do',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          surface: Color.fromARGB(255, 223, 224, 226),
          onSurface: Color.fromARGB(255, 35, 181, 211),
          surfaceDim: Color.fromARGB(255, 212, 212, 212),
          primary: Color.fromARGB(255, 35, 181, 211),
          onPrimary: Color.fromARGB(255, 236, 236, 236),
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: const ColorScheme.dark(
          surface: Color.fromARGB(255, 22, 22, 22),
          onSurface: Color.fromARGB(255, 178, 38, 202),
          surfaceDim: Color.fromARGB(255, 51, 51, 51),
          primary: Color.fromARGB(255, 178, 38, 202),
          onPrimary: Color.fromARGB(255, 36, 36, 36),
        ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.light, // TODO: change this to whatever is saved in shared preferences once that's setup
      home: const LoadingPage(),
    );
  }
}