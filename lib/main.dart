import 'package:flutter/material.dart';
import 'Pages/Introduction/index.dart';
import 'Pages/Login/index.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Consulta Esperta',
      debugShowCheckedModeBanner: false,
      //initialRoute: '/',
      routes: {
        //'/': (context) => MyHomePage(),
        '/login': (context) => Login()
      },
      home: Introduction(),
    );
  }
}
