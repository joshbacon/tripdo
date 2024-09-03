import 'package:flutter/material.dart';
import 'package:tripdo/widgets/nav_bar.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Create New List'),
      ),
      bottomNavigationBar: const NavBar(),
    );
  }
}