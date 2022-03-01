import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/chat.dart';
import 'screens/login.dart';
import 'screens/signup.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => Home(),
        '/login': (context) => Login(),
        '/signup': (context) => SignUp(),
        '/chat': (context) => Chat(),
      },
    ));
