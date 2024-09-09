import 'package:flutter/material.dart';
import 'package:tripdo/models/user.dart';
import 'package:tripdo/widgets/profile_viewer.dart';

// TODO:
// adapt this for 3 cases (or make individial widgets)
// - is already a friend
// - is not yeat a friend
// - is being added to a trip
// * maybe put the first two in one widget and the last in it's own

class UserCard extends StatefulWidget {
  const UserCard({super.key, required this.user});

  final User user;

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {

  void viewProfile() {
    showDialog(
      context: context,
      builder: (BuildContext context) => ProfileView(user: widget.user),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: viewProfile,
      child: Card(
        color: Theme.of(context).colorScheme.surfaceDim,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical:  8.0),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.user.getName(),
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    )
                  ),
                  Text(
                    '${widget.user.getSharedTrips().length} shared trips',
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                    )
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}