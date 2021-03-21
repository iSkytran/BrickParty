import 'package:brick_party/event_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Events extends StatefulWidget {
  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  Future<void> _addEvent() async {
    await Navigator.of(context).pushNamed('/add_event');
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference events =
        FirebaseFirestore.instance.collection('events');

    return Stack(children: [
      StreamBuilder<QuerySnapshot>(
          stream: events.snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text("Something went wrong.");
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading...");
            }
            return ListView(
              children: snapshot.data.docs.map((DocumentSnapshot document) {
                return EventItem(
                    document.reference.id,
                    document.data()['title'],
                    document.data()['description'],
                    document.data()['organizer'],
                    document.data()['participants']);
              }).toList(),
            );
          }),
      Positioned(
          right: 30.0,
          bottom: 30.0,
          child: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: _addEvent,
          )),
    ]);
  }
}
