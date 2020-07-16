import 'package:flutter/material.dart';
import 'package:mobile/Services/Authentication/index.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Authentication _auth = Authentication();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () async {
            await _auth.signOut();
          },
          child: Text("Sair"),
        ),
      ),
    );
  }
}
