import 'package:brick_party/events.dart';
import 'package:brick_party/settings.dart';
import 'package:brick_party/your_events.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BrickParty',
      theme: ThemeData(
        primaryColor: Colors.red[800],
      ),
      home: HomePage(title: 'BrickParty'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

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
            title: Text(widget.title),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            )),
        body: TabBarView(
          children: [Events(), YourEvents(), Settings()],
        ),
      ),
    );
  }
}
