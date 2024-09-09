// hold all user data like id, name, email, password, profile picture


import 'package:tripdo/models/trip_data.dart';

class User {

  int id = 1;
  String name = "user";
  List<int> friendIDs = [];

  User(this.id, this.name, this.friendIDs);

  List<TripData> getSharedTrips() {
    // call the backend for shared trips
    return [];
  }

  int getID() { return id; }
  String getName() { return name; }

}