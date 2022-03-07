import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

Future<User?> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );
  final UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);
  // Once signed in, return the UserCredential

  return userCredential.user;
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 243, 33, 156),
          title: const Text('Chat App'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icon2.png',
                scale: 2,
              ),
              SizedBox(
                width: 300,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary:
                        const Color.fromARGB(255, 243, 33, 156), // background
                    onPrimary: Colors.white, // foreground
                    fixedSize: const Size(230, 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Text('Login'),
                ),
              ),
              //  Register Button
              SizedBox(
                width: 300,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary:
                          const Color.fromARGB(255, 243, 33, 156), // background
                      onPrimary: Colors.white, // foreground
                      fixedSize: const Size(230, 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0))),
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: const Text('Sign Up'),
                ),
              ),
              const Text('Or Sign In with:'),
              SizedBox(
                width: 300 / 2,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary:
                          const Color.fromARGB(255, 243, 33, 156), // background
                      onPrimary: Colors.white, // foreground
                      fixedSize: const Size(230, 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0))),
                  onPressed: () async {
                    await signInWithGoogle();
                    Navigator.pushNamed(context, '/chat');
                  },
                  child: const Text('Google'),
                ),
              ),
            ],
          ),
        ));
  }
}
