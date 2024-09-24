import 'package:flutter/material.dart';
import 'package:tripdo/models/user.dart';
import 'package:tripdo/widgets/user_card.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {

  List<String> selectedFriends = [
    "Jacob", "Jared"
  ];

  List<UserCard> filteredFriends = [
    UserCard(user: User(1, "Bacon", [])),
    UserCard(user: User(2, "Liam", [])),
    UserCard(user: User(3, "Neil", [])),
    UserCard(user: User(3, "Neil", [])),
    UserCard(user: User(3, "Neil", [])),
    UserCard(user: User(3, "Neil", [])),
  ];
  
  TextEditingController titleController = TextEditingController();
  DateTime departureDate = DateTime.now();
  TextEditingController searchController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: departureDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2070, 2, 28, 9));
    if (picked != null && picked != departureDate) {
      setState(() {
        departureDate = picked;
      });
    }
  }

  void createTrip() {
    // TODO:
    // - make an api call to creat a DB item
    // - figure out how to send push notifications too people added
    // - show a confirmation/error dialog
  }
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Container(
        color: Colors.transparent, // Children widgets eat the onTap without this for some reason
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 32.0,),
            const Text(
              'Start planning a trip today!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextField(
              controller: titleController,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w500,
                ),
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Name',
                labelStyle: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 10.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Departure Date",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                      onPressed: () => _selectDate(context),
                      child: Text(
                        departureDate.toString().split(" ")[0],
                        style: const TextStyle(
                          fontSize: 18.0
                        ),
                      )
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.grey,
                      ),
                      onPressed: () => _selectDate(context),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 10.0,),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                child: Column(
                  children: [
                    const Text(
                    "Invite Friends",
                      style: TextStyle(
                        fontSize: 24.0
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            TextField(
                              controller: searchController,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.search),
                                border: UnderlineInputBorder(),
                                hintText: 'search',
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            ...filteredFriends
                          ],
                        ),
                      ),
                    )
                  ]
                ),
              ),
            ),
            const SizedBox(height: 8.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 8.0,
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    shadowColor: Theme.of(context).colorScheme.primary,
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.save),
                      SizedBox(width: 8.0,),
                      Text("Confirm"),
                    ],
                  ),
                  onPressed: () => createTrip(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}