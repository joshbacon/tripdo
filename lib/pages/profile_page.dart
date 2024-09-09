import 'package:flutter/material.dart';
import 'package:tripdo/models/user.dart';
import 'package:tripdo/widgets/trip_item.dart';
import 'package:tripdo/widgets/user_card.dart';

// TODO:
// - implement settings
// - add a transition animation
// - replace future trips (just the home page) and put in a socials card (just firends list and add)

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  bool futureFocus = true;
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
  
  List<TripItem> tripHistory = [
    const TripItem(),
    const TripItem(),
    const TripItem(),
    const TripItem(),
    const TripItem(),
  ];

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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 32.0),
            Card(
              color: Theme.of(context).colorScheme.primary,
              elevation: 8.0,
              shadowColor: Theme.of(context).colorScheme.primary,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(13.0, 24.0, 8.0, 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 42.0,
                          backgroundImage: NetworkImage(
                            'https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fimages4.fanpop.com%2Fimage%2Fphotos%2F15700000%2FAppa-avatar-the-last-airbender-15716105-456-317.jpg&f=1&nofb=1&ipt=95efb8b565e9773f3b216407e9527585e1a6dee3d6f7b42b82dd7d0aeff3ae6e&ipo=images',
                          ),
                        ),
                        const SizedBox(width: 15.0),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Bacon',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // const SizedBox(height: 8.0),
                            Text(
                              'Joined Sept 4th, 2024',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.settings,
                        size: 36.0,
                        color: Theme.of(context).colorScheme.surface,
                      ),
                      onPressed: () {
      
                      }
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Expanded(
              flex: futureFocus ? 1 : 0,
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
                          IconButton(
                            icon: Icon(
                              Icons.arrow_drop_down_circle_outlined,
                              color: !futureFocus ?
                                Theme.of(context).colorScheme.primary :
                                Colors.transparent
                            ),
                            onPressed: () {
                              setState(() {
                                futureFocus = true;
                              });
                            },
                          )
                        ],
                      ),
                      Visibility(
                        visible: futureFocus,
                        child: Expanded(
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
            ),
            const SizedBox(height: 8.0),
            Expanded(
              flex: futureFocus ? 0 : 1,
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
                            ' Trip History',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.arrow_drop_down_circle_outlined,
                              color: futureFocus ?
                                Theme.of(context).colorScheme.primary :
                                Colors.transparent
                            ),
                            onPressed: () {
                              setState(() {
                                futureFocus = false;
                              });
                            },
                          ),
                        ],
                      ),
                      Visibility(
                        visible: !futureFocus,
                        child: Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: tripHistory,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}