import 'package:flutter/material.dart';

import 'package:greenify/auth/start.dart';
import 'package:greenify/main_menu/my_plants/my_plants.dart';

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
