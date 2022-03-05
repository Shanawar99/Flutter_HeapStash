import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final auth = FirebaseAuth.instance;
  late String email;
  late String password;
  late String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sign Up'),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 243, 33, 156),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: TextField(
                onChanged: (value) {
                  name = value;
                },
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'Enter your name'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: TextField(
                onChanged: (value) {
                  email = value;
                },
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(), hintText: 'Email Address'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: TextField(
                onChanged: (value) {
                  password = value;
                },
                obscureText: true,
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'Enter your password'),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 243, 33, 156), // background
                  onPrimary: Colors.white, // foreground
                  fixedSize: const Size(230, 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0))),
              onPressed: () async {
                try {
                  final newUser = await auth.createUserWithEmailAndPassword(
                      email: email, password: password);
                  newUser.user!.updateDisplayName(name);
                  if (newUser != null) {
                    Navigator.pushNamed(context, '/chat');
                  }
                } catch (e) {
                  print(e);
                }
              },
              child: const Text('Sign Up'),
            )
          ],
        )));
  }
}
