import 'package:flutter/material.dart';
import 'package:flutter_application_3/services/worldtime.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(
        url: 'Europe/London', location: 'London', flag: 'uk.png', isDay: true),
    WorldTime(
        url: 'Europe/Berlin',
        location: 'Athens',
        flag: 'greece.png',
        isDay: true),
    WorldTime(
        url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png', isDay: true),
    WorldTime(
        url: 'Africa/Nairobi',
        location: 'Nairobi',
        flag: 'kenya.png',
        isDay: true),
    WorldTime(
        url: 'America/Chicago',
        location: 'Chicago',
        flag: 'usa.png',
        isDay: true),
    WorldTime(
        url: 'America/New_York',
        location: 'New York',
        flag: 'usa.png',
        isDay: true),
    WorldTime(
        url: 'Asia/Seoul',
        location: 'Seoul',
        flag: 'south_korea.png',
        isDay: true),
    WorldTime(
        url: 'Asia/Jakarta',
        location: 'Jakarta',
        flag: 'indonesia.png',
        isDay: true),
  ];

  void updateTime(index) async {
    WorldTime ins = locations[index];
    await ins.getData();
    Navigator.pop(context, {
      'url': ins.url,
      'location': ins.location,
      'time': ins.time,
      'flag': ins.flag,
      'isday': ins.isDay,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 1, 66, 119),
        title: const Text('Choose Location'),
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                updateTime(index);
              },
              title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundColor: Colors.red,
                backgroundImage: AssetImage(locations[index].flag),
              ),
            ),
          );
        },
      ),
    );
  }

  itemBuilder(BuildContext context, index) {}
}
