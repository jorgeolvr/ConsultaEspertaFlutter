import 'package:flutter/material.dart';
import 'package:mobile/Models/User/index.dart';
import 'package:mobile/Pages/Login/index.dart';
import 'package:mobile/Pages/Home/index.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);

    if (user == null) {
      return Login();
    } else {
      return Home();
    }
  }
}
