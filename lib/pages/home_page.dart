import 'package:flutter/material.dart';
import 'package:tripdo/widgets/nav_bar.dart';
import 'package:tripdo/widgets/master_list_item.dart';

// TODO:
// - 

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<MasterListItem> items = [
    const MasterListItem(),
    const MasterListItem(),
    const MasterListItem(),
    const MasterListItem(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: items,
          ),
        ),
      ),
      bottomNavigationBar: const NavBar(),
    );
  }
}
