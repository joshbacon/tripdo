import 'package:flutter/material.dart';
import 'package:tripdo/widgets/nav_bar.dart';

// TODO:
// - show list of ongoing checklists
// - show username and icon
// -- have a way to edit
//    (whole other page or just an edit button with a dialog?)
// - have a list history (because why not, nostalgia right?)

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Profile'),
      ),
      bottomNavigationBar: const NavBar(),
    );
  }
}