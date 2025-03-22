import 'package:flutter/material.dart';

// import 'package:greenify/api_service.dart';

import 'package:greenify/auth/register/confirm.dart';
import 'package:greenify/auth/register/register.dart';
import 'package:greenify/auth/start.dart';
import 'package:greenify/auth/login/login.dart';
import 'package:greenify/main_menu/my_plants/my_plants.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Greenify',
      initialRoute: '/',
      routes: {
        '/': (context) => AuthWrapper(),
        '/myPlants': (context) => MyPlants(),
        '/login': (context) => Login(),
        '/register': (context) => Register(),
        '/confirm': (context) => Confirm(),
      },
    );
  }
}

class AuthWrapper extends StatefulWidget {
  @override
  _AuthWrapperState createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  bool _hasSession = false;

  @override
  void initState() {
    super.initState();
    _checkSession();
  }

  Future<void> _checkSession() async {
    final cookie = await SharedPreferences.getInstance().then(
      (prefs) => prefs.getString('auth_cookie'),
    );

    if (cookie != null && cookie.isNotEmpty) {
      setState(() {
        _hasSession = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _hasSession ? MyPlants() : HomePage();
  }
}
