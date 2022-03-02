import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          title: const Text('Chat App'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue[500], // background
                  onPrimary: Colors.white, // foreground
                  fixedSize: const Size(230, 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0)),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: const Text('Login'),
              ),
              //  Register Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue[500], // background
                    onPrimary: Colors.white, // foreground
                    fixedSize: const Size(230, 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0))),
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: const Text('Sign Up'),
              ),
              // FloatingActionButton.extended(
              //     onPressed: () {}, label: Text('Test'))
            ],
          ),
        ));
  }
}
