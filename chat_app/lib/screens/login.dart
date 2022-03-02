import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late String email;
  late String password;
  final auth = FirebaseAuth.instance;
  User? user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign In'),
        ),
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) {
                email = value;
              },
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your Email',
              ),
            ),
            TextField(
              onChanged: (value) {
                password = value;
              },
              obscureText: true,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your password',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  UserCredential userCredential =
                      await auth.signInWithEmailAndPassword(
                          email: email, password: password);
                  user = userCredential.user;
                  if (user != null) {
                    Navigator.pushNamed(context, '/chat');
                  }
                } catch (e) {
                  print(e);
                }
              },
              child: const Text('Sign In'),
            )
          ],
        )));
  }
}
