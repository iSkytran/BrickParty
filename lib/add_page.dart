import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  Future<void> _addEvent() {
    CollectionReference events =
        FirebaseFirestore.instance.collection('events');
    return events.add({
      'title': _titleController.text,
      'description': _descriptionController.text,
      'organizer': FirebaseAuth.instance.currentUser.email,
      'participants': [FirebaseAuth.instance.currentUser.uid]
    }).then((value) {
      print("Event Added");
      Navigator.of(context).pop();
    }).catchError((error) => print("Failed to add event: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding:
              EdgeInsets.only(left: 10.0, right: 10.0, top: 0.0, bottom: 0.0),
          child: TextField(
            controller: _titleController,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: "Title"),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(left: 10.0, right: 10.0, top: 15.0, bottom: 0.0),
          child: TextField(
            controller: _descriptionController,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: "Description"),
          ),
        ),
        Container(
            padding: EdgeInsets.only(
                left: 10.0, right: 10.0, top: 15.0, bottom: 0.0),
            height: 50,
            width: 250,
            child: TextButton(
              onPressed: _addEvent,
              child: Text("Add Event"),
            ))
      ],
    )));
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
