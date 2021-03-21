import 'package:brick_party/event_item.dart';
import 'package:flutter/material.dart';

class Events extends StatefulWidget {
  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  final _eventItems = <EventItem>[];

  void _addEvent() {
    setState(() {
      _eventItems.add(EventItem());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ListView.builder(
          padding: EdgeInsets.all(4.0),
          itemCount: _eventItems.length,
          itemBuilder: (context, i) {
            return _eventItems[i];
          }),
      Positioned(
          right: 30.0,
          bottom: 30.0,
          child: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: _addEvent,
            backgroundColor: Colors.red[800],
          )),
    ]);
  }
}
