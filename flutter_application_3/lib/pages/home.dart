import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

Map data = {};

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;
    print(data);
    String bgimage = data['isday'] ? 'day.png' : 'night.jpg';

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(bgimage), fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 100, 0, 0),
            child: Column(
              children: [
                ElevatedButton.icon(
                    onPressed: () async {
                      dynamic res =
                          await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'time': res['time'],
                          'location': res['location'],
                          'isday': res['isday'],
                          'flag': res['flag']
                        };
                      });
                    },
                    icon: const Icon(Icons.edit_location),
                    label: const Text('Edit Location')),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(data['location'],
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.red,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 10),
                Text(data['time'],
                    style: const TextStyle(
                        fontSize: 40,
                        color: Colors.red,
                        fontWeight: FontWeight.bold))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
