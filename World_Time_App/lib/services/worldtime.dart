import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time = '';
  String flag;
  String url;
  bool isDay; //= true;
  WorldTime({
    required this.location,
    required this.flag,
    required this.url,
    required this.isDay,
  });

  Future<void> getData() async {
    // await Future.delayed(Duration(seconds: 5), () {});
    try {
      print(url);
      Response response = await http
          .get(Uri.parse("https://worldtimeapi.org/api/timezone/$url"));
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      isDay = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
      print(time);
    } catch (e) {
      time = 'Time API is not working';
    }
  }
}
