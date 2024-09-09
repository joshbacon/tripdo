import 'package:flutter/material.dart';
import 'package:tripdo/models/user.dart';
import 'package:tripdo/widgets/trip_item.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key, required this.user});

  final User user;

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  
  List<TripItem> tripHistory = [
    const TripItem(),
    const TripItem(),
    const TripItem(),
    const TripItem(),
    const TripItem(),
  ];

  void removeFriend() {
    // make an api call
    // remove them from the local list
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircleAvatar(
              radius: 42.0,
              backgroundImage: NetworkImage(
                'https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fimages4.fanpop.com%2Fimage%2Fphotos%2F15700000%2FAppa-avatar-the-last-airbender-15716105-456-317.jpg&f=1&nofb=1&ipt=95efb8b565e9773f3b216407e9527585e1a6dee3d6f7b42b82dd7d0aeff3ae6e&ipo=images',
              ),
            ),
            Text(
              widget.user.getName(),
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w800,
              ),
            ),
            const Row(
              children: [
                Text(
                  "Shared Trips",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: tripHistory,
                ),
              )
            ),
            Divider(
              color: Theme.of(context).colorScheme.primary,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 8.0,
                backgroundColor: Colors.red,
                shadowColor: Colors.red,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.delete,
                    color: Theme.of(context).colorScheme.surface,
                  ),
                  const SizedBox(width: 5.0,),
                  Text(
                    "Remove Friend",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                ],
              ),
              onPressed: () => removeFriend(),
            ),
            Divider(
              color: Theme.of(context).colorScheme.primary,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 8.0,
                backgroundColor: Theme.of(context).colorScheme.primary,
                shadowColor: Theme.of(context).colorScheme.primary,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.close,
                    color: Theme.of(context).colorScheme.surface,
                  ),
                  const SizedBox(width: 5.0,),
                  Text(
                    "Close",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                ],
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}