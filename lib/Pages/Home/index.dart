import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile/Services/Authentication/index.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FirebaseUser currentUser;
  final Authentication _auth = Authentication();
  @override
  void initState() {
    super.initState();
    _loadCurrentUser();
  }

  void _loadCurrentUser() {
    FirebaseAuth.instance.currentUser().then((FirebaseUser user) {
      setState(() {
        this.currentUser = user;
      });
    });
  }

  String _getUsername() {
    if (currentUser != null) {
      return currentUser.displayName;
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        brightness: Brightness.light,
        backgroundColor: Color(0xFFF5FFFA),
        elevation: 0,
        title: Container(
            width: 40,
            child: Image.asset("assets/images/simbolo-consulta.png")),
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
      body: Container(
        child: Center(child: Text(_getUsername())),
      ),
    );
  }
}
