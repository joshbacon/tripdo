import 'package:flutter/material.dart';
import 'package:tripdo/widgets/master_list_item.dart';

// TODO:
// - just need to actually pull the checklists from the backend

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<MasterListItem> items = [
    const MasterListItem(),
    const MasterListItem(),
    const MasterListItem(),
    const MasterListItem(),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32.0),
            const Text(
              ' Trip-Do',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            ...items
          ],
        ),
      ),
    );
  }
}
