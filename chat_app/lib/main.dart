import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/chat.dart';
import 'screens/login.dart';
import 'screens/signup.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(initialRoute: '/', routes: {
    '/': (context) => const Home(),
    '/login': (context) => const Login(),
    '/signup': (context) => const SignUp(),
    '/chat': (context) => const Chat(),
  }));
}
