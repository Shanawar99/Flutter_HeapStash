import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_application_3/services/worldtime.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'loading';
  void setupWorldTime() async {
    WorldTime w1 = WorldTime(
        location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await w1.getData();
    Navigator.pushReplacementNamed(context, '/home',
        arguments: {'location': w1.location, 'time': w1.time, 'flag': w1.flag});
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(100.0),
        child: Text('loading'),
      ),
    );
  }
}
