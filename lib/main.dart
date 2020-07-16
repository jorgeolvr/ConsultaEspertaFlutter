import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Pages/Introduction/index.dart';
import 'Pages/Wrapper/index.dart';
import 'Models/User/index.dart';
import 'Services/Authentication/index.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: Authentication().user,
      child: MaterialApp(
        title: 'Consulta Esperta',
        debugShowCheckedModeBanner: false,
        //initialRoute: '/',
        routes: {
          //'/': (context) => MyHomePage(),
          '/wrapper': (context) => Wrapper()
        },
        home: Introduction(),
      ),
    );
  }
}
