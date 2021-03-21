import 'package:brick_party/event_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class YourEvents extends StatefulWidget {
  @override
  _YourEventsState createState() => _YourEventsState();
}

class _YourEventsState extends State<YourEvents> {
  CollectionReference events = FirebaseFirestore.instance.collection('events');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: events.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
        });
  }
}
