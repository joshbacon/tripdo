import 'package:flutter/material.dart';

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
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('[Name of Checklist]'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              size: 32.0,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}