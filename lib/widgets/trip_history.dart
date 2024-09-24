import 'package:flutter/material.dart';
import 'package:tripdo/widgets/trip_item.dart';

class TripHistory extends StatefulWidget {
  const TripHistory({super.key});

  @override
  State<TripHistory> createState() => _TripHistoryState();
}

class _TripHistoryState extends State<TripHistory> {

  bool focus = false;

  List<TripItem> trips = [
    const TripItem(),
    const TripItem(),
    const TripItem(),
    const TripItem(),
    const TripItem(),
  ];

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
                      color: focus ?
                        Theme.of(context).colorScheme.primary :
                        Colors.transparent
                    ),
                    onPressed: () {
                      setState(() {
                        focus = false;
                      });
                    },
                  ),
                ],
              ),
              Visibility(
                visible: !focus,
                child: Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: trips,
                    ),
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