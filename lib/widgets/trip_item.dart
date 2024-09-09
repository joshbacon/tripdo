import 'package:flutter/material.dart';
import 'package:tripdo/pages/checklist_page.dart';

// TODO:
// - make this a button that brings you to a viewing page

class TripItem extends StatefulWidget {
  const TripItem({super.key});

  @override
  State<TripItem> createState() => _TripItemState();
}

class _TripItemState extends State<TripItem> {

  String title = 'Glenelg';
  String claim = 'Bacon';
  String date = 'Sept 7th, 2024';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ChecklistPage())
        );
      },
      child: Card(
        color: Theme.of(context).colorScheme.surfaceDim,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 18.0),
            decoration: const BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: Colors.orange,
                  width: 5.0
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      )
                    ),
                    Text(
                      date,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      )
                    ),
                  ],
                ),
                const CircleAvatar(
                  radius: 18.0,
                  backgroundImage: NetworkImage(
                    'https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fimages4.fanpop.com%2Fimage%2Fphotos%2F15700000%2FAppa-avatar-the-last-airbender-15716105-456-317.jpg&f=1&nofb=1&ipt=95efb8b565e9773f3b216407e9527585e1a6dee3d6f7b42b82dd7d0aeff3ae6e&ipo=images',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}