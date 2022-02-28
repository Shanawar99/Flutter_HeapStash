import 'package:flutter/material.dart';
import 'package:flutter_application_3/services/worldtime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'loading';
  void setupWorldTime() async {
    WorldTime w1 = WorldTime(
        location: 'Berlin',
        flag: 'germany.png',
        url: 'Europe/Berlin',
        isDay: true);
    await w1.getData();

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': w1.location,
      'time': w1.time,
      'flag': w1.flag,
      'isday': w1.isDay,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
