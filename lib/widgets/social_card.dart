import 'package:flutter/material.dart';
import 'package:tripdo/models/user.dart';
import 'package:tripdo/widgets/user_card.dart';

class SocialCard extends StatefulWidget {
  const SocialCard({super.key});

  @override
  State<SocialCard> createState() => _SocialCardState();
}

class _SocialCardState extends State<SocialCard> {

  bool focus = false;
  bool searching = false;
  bool friendsSelected = true;
  TextEditingController searchController = TextEditingController();

  // change all these UserCard types to just User and map them in a list buider
  // then you can use friendsSelected and the length of the search results to choose which one to display
  List<UserCard> searchResults = [];
  List<UserCard> friendsList = [
    UserCard(user: User(1, "Bacon", [])),
    UserCard(user: User(2, "Liam", [])),
    UserCard(user: User(3, "Neil", [])),
  ];
  List<UserCard> friendSugestions = [
    UserCard(user: User(1, "Neil", [])),
    UserCard(user: User(2, "Liam", [])),
    UserCard(user: User(3, "Bacon", [])),
  ]; // set this to unadded friends of friends, use as default add new if nothing is searched

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: focus ? 1 : 0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ' Social',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ( focus ? IconButton(
                      icon: Icon(
                        Icons.search_outlined,
                        color: Theme.of(context).colorScheme.primary
                      ),
                      onPressed: () {
                        setState(() {
                          searching = !searching;
                        });
                      },
                    ) : IconButton(
                      icon: Icon(
                        Icons.arrow_drop_down_circle_outlined,
                        color: Theme.of(context).colorScheme.primary
                      ),
                      onPressed: () {
                        setState(() {
                          focus = true;
                        });
                      },
                    )
                  )
                ],
              ),
              Visibility(
                visible: focus,
                child: Expanded(
                  child: Column(
                    children: [
                      Visibility(
                        visible: searching,
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                            fillColor: Colors.red,
                            focusColor: Colors.red,
                            contentPadding: const EdgeInsets.only(left: 10.0),
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.keyboard_double_arrow_right_outlined),
                              iconSize: 28.0,
                              onPressed: () {
                                //TODO: implement a search filter when API is created
                                // ... or just debouce the input and don't have a button...
                              },
                            ),
                            border: const OutlineInputBorder(),
                            hintText: 'search',
                            hintStyle: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: friendsSelected ? BorderSide(
                                            color: Theme.of(context).colorScheme.primary,
                                            width: 3.0,
                                          ) : const BorderSide(
                                            width: 0.0,
                                          ),
                                        )
                                      ),
                                      child: TextButton(
                                        child: const Text("Friends"),
                                        onPressed: () {
                                          setState(() {
                                            friendsSelected = true;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: !friendsSelected ? BorderSide(
                                            color: Theme.of(context).colorScheme.primary,
                                            width: 3.0,
                                          ) : const BorderSide(
                                            width: 0.0,
                                          ),
                                        )
                                      ),
                                      child: TextButton(
                                        child: const Text("Add New"),
                                        onPressed: () {
                                          setState(() {
                                            friendsSelected = false;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              ...friendsList
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}