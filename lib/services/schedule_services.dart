import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/Harbour.dart';
import '../models/Schedule.dart';

class ScheduleServices {
  static Future<List<Harbour>> fetchHarbour() async {
    final response =
        await http.get(Uri.parse('https://tipal.my.id/api_get_harbor.php'));

    if (response.statusCode == 200) {
      var decodedResponse = jsonDecode(response.body);
      return (decodedResponse as List).map((e) => Harbour.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load harbour');
    }
  }

  static Future<List<Schedule>> fetchSchedule(String from, String to) async {
    final response = await http.get(Uri.parse(
        'https://tipal.my.id/api_get_schedule.php?harbor_from=${from}&harbor_to=${to}'));

    if (response.statusCode == 200) {
      print('get');
      var decodedResponse = jsonDecode(response.body);
      print(decodedResponse);
      return (decodedResponse as List)
          .map((e) => Schedule.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to load schedule');
    }
  }
}
