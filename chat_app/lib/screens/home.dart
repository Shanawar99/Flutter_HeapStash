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
                width: double.infinity,
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
                width: double.infinity,
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
            ],
          ),
        ));
  }
}
