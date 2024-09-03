import 'package:flutter/material.dart';
import 'package:tripdo/widgets/nav_bar.dart';

// TODO:
// - have a settings button that lets you change the list name, add/remove people, etc.
// - also have an option to leave a list or mark as complete

class ChecklistPage extends StatefulWidget {
  const ChecklistPage({super.key});

  @override
  State<ChecklistPage> createState() => _ChecklistPageState();
}

class _ChecklistPageState extends State<ChecklistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('[Name of Checklist]'),
      ),
      bottomNavigationBar: const NavBar(),
    );
  }
}