import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EventItem extends StatefulWidget {
  final String id;
  final String title;
  final String description;
  final String organizer;
  final List participants;

  EventItem(
      this.id, this.title, this.description, this.organizer, this.participants);

  @override
  _EventItemState createState() => _EventItemState();
}

class _EventItemState extends State<EventItem> {
  void _addParticipant() async {
    CollectionReference events =
        FirebaseFirestore.instance.collection('events');
    List participants;
    await events
        .doc(widget.id.toString())
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        participants = documentSnapshot.data()['participants'];
        participants.add(FirebaseAuth.instance.currentUser.uid);
      } else {
        print('Document does not exist on the database');
      }
      ;
    });
    events
        .doc(widget.id.toString())
        .update({'participants': participants}).then((value) {
      print("Event Updated");
    }).catchError((error) => print("Failed to update event: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      title: Text(widget.title),
      subtitle: Center(
          child: Column(
        children: [
          Container(
              padding: EdgeInsets.only(
                  left: 10.0, right: 10.0, top: 5.0, bottom: 0.0),
              child: Row(
                children: [Text(widget.description)],
              )),
          Container(
              padding: EdgeInsets.only(
                  left: 10.0, right: 10.0, top: 5.0, bottom: 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Organizer: " + widget.organizer.toString()),
                  TextButton(
                      onPressed: _addParticipant,
                      child: Text(widget.participants.length.toString() +
                          " Participant(s)"))
                ],
              )),
        ],
      )),
    ));
  }
}
