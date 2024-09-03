import 'package:flutter/material.dart';
import 'package:tripdo/models/colors.dart';

// TODO:
// - make this a button that brings you to a viewing page

class MasterListItem extends StatefulWidget {
  const MasterListItem({super.key});

  @override
  State<MasterListItem> createState() => _MasterListItemState();
}

class _MasterListItemState extends State<MasterListItem> {

  String title = 'Item 1';
  String claim = 'Bacon';

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.secondary,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 5.0
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    title,
                    style: TextStyle(color: Theme.of(context).colorScheme.onSecondary)
                  ),
                  Text(
                    claim,
                    style: TextStyle(color: Theme.of(context).colorScheme.onSecondary)
                  ),
                ],
              ),
              const CircleAvatar(
                radius: 16.0,
                backgroundImage: NetworkImage(
                  'https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fimages4.fanpop.com%2Fimage%2Fphotos%2F15700000%2FAppa-avatar-the-last-airbender-15716105-456-317.jpg&f=1&nofb=1&ipt=95efb8b565e9773f3b216407e9527585e1a6dee3d6f7b42b82dd7d0aeff3ae6e&ipo=images',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}