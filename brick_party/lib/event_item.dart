import 'package:flutter/material.dart';

class EventItem extends StatefulWidget {
  @override
  _EventItemState createState() => _EventItemState();
}

class _EventItemState extends State<EventItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Hello"),
    );
  }
}
