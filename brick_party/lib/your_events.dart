import 'package:brick_party/event_item.dart';
import 'package:flutter/material.dart';

class YourEvents extends StatefulWidget {
  @override
  _YourEventsState createState() => _YourEventsState();
}

class _YourEventsState extends State<YourEvents> {
  final _yourEventItems = <EventItem>[];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.all(4.0),
        itemCount: _yourEventItems.length,
        itemBuilder: (context, i) {
          return _yourEventItems[i];
        });
  }
}
