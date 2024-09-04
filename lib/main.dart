import 'package:flutter/material.dart';
import 'package:tripdo/models/colors.dart';
import 'package:tripdo/pages/loading_page.dart';

// TODO:
// - add navigation
// - refine the color themes

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
        colorScheme: ColorScheme.light(
          surface: backgroundLight,
          onSurface: primaryLight,
          primary: primaryLight,
          onPrimary: accentPrimaryLight,
          secondary: accentBackLight,
          onSecondary: accentPrimaryLight,
          tertiary: secondaryLight,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.dark(
          surface: backgroundDark,
          onSurface: primaryDark,
          primary: primaryDark,
          onPrimary: backgroundDark,
          secondary: accentBackDark,
          tertiary: secondaryDark,
        ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.light, // TODO: change this to whatever is saved in shared preferences once that's setup
      home: const LoadingPage(),
    );
  }
}