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
        appBar: new AppBar(
          brightness: Brightness.light,
          backgroundColor: Color(0xFFF5FFFA),
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Color(0xFF3F51B5),
            ),
            onPressed: () async {
              await _auth.signOut();
            },
          ),
        ),
        backgroundColor: Color(0xFFF5FFFA),
        body: Container());
  }
}
