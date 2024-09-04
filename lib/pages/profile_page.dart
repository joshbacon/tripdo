import 'package:flutter/material.dart';

// TODO:
// - show list of ongoing checklists
// - show username and icon
// -- have a way to edit
//    (whole other page or just an edit button with a dialog?)
// - have a list history (because why not, nostalgia right?)
// - for the settings, have an edit button that triggers a bunch of animations that bring out the individual edit buttons

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 64.0,
            backgroundImage: NetworkImage(
              'https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fimages4.fanpop.com%2Fimage%2Fphotos%2F15700000%2FAppa-avatar-the-last-airbender-15716105-456-317.jpg&f=1&nofb=1&ipt=95efb8b565e9773f3b216407e9527585e1a6dee3d6f7b42b82dd7d0aeff3ae6e&ipo=images',
            ),
          ),
          Text('profile'),
        ],
      ),
    );
  }
}