import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time = '';
  String flag;
  String url;
  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getData() async {
    try {
      http.Response response = await http
          .get(Uri.parse("https://worldtimeapi.org/api/timezone/$url"));
      Map data = jsonDecode(response.body);
      //print(data);

      String datetime = data['datetime'];
      DateTime now = DateTime.parse(datetime);
      time = DateFormat.jm().format(now);
      print(time);
    } catch (e) {
      time = 'Time API is not working';
    }
  }
}
