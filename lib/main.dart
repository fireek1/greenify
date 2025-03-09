import 'package:flutter/material.dart';

import 'package:greenify/auth/register/confirm.dart';
import 'package:greenify/auth/register/register.dart';
import 'package:greenify/auth/start.dart';
import 'package:greenify/auth/login/login.dart';
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
        '/login': (context) => Login(),
        '/register': (context) => Register(),
        '/confirm': (context) => Confirm(),
      },
    );
  }
}
