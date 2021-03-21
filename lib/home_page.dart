import 'package:brick_party/events.dart';
import 'package:brick_party/settings.dart';
import 'package:brick_party/your_events.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
            title: Text("BrickParty"),
            bottom: TabBar(
              tabs: [
                Tab(icon: Image.asset("assets/calendar.png")),
                Tab(icon: Image.asset("assets/checkmark.png")),
                Tab(icon: Image.asset("assets/white_gear.png")),
              ],
            )),
        body: TabBarView(
          children: [Events(), YourEvents(), Settings()],
        ),
      ),
    );
  }
}
