import 'package:flutter/material.dart';
import 'package:greenify/start.dart';
import 'package:greenify/myPlants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Greenify',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/myPlants': (context) => MyPlants(),
      },
    );
  }
}
