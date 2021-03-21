import 'package:brick_party/add_page.dart';
import 'package:brick_party/home_page.dart';
import 'package:brick_party/loading.dart';
import 'package:brick_party/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(App());
}

class App extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
                title: 'BrickParty',
                theme: ThemeData(
                  primaryColor: Colors.red[800],
                  floatingActionButtonTheme: FloatingActionButtonThemeData(
                      backgroundColor: Colors.red[800]),
                  textButtonTheme: TextButtonThemeData(
                      style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.red[800])),
                ),
                debugShowCheckedModeBanner: false,
                routes: <String, WidgetBuilder>{
                  '/': (context) => LoginPage(),
                  '/home': (context) => HomePage(),
                  '/add_event': (context) => AddPage(),
                });
          }
          return Loading();
        });
  }
}
