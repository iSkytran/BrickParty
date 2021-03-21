import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.red[800],
        child: Center(
          child: Text("Loading...", textDirection: TextDirection.ltr),
        ));
  }
}
