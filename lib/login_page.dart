import 'package:brick_party/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<void> _loginCredentials() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      Navigator.of(context).pushReplacementNamed('/home');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  bool _isLoggedIn() {
    try {
      final User user = FirebaseAuth.instance.currentUser;
      return user != null;
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoggedIn()) {
      return HomePage();
    }
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset("assets/brick_party_icon.png"),
        Padding(
          padding:
              EdgeInsets.only(left: 15.0, right: 15.0, top: 0.0, bottom: 0.0),
          child: TextField(
            controller: _emailController,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: "Email"),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0, bottom: 0.0),
          child: TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: "Password"),
          ),
        ),
        Container(
            padding: EdgeInsets.only(
                left: 15.0, right: 15.0, top: 15.0, bottom: 0.0),
            height: 50,
            width: 250,
            child: TextButton(
              onPressed: _loginCredentials,
              child: Text("Login"),
            ))
      ],
    )));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
