import 'package:http/http.dart' as http;
import 'package:tipal/view/widgets/adult_child_widget.dart';
import 'dart:convert';

import '../models/Harbour.dart';
import '../models/Schedule.dart';
import '../models/Ticket.dart';

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
      var decodedResponse = jsonDecode(response.body);

      return (decodedResponse as List)
          .map((e) => Schedule.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to load schedule');
    }
  }

  static Future<http.Response> placeOrder(
      {required String scheduleId,
      required String name,
      required String seats}) {
    return http.post(
      Uri.parse('https://tipal.my.id/api_post_order.php'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'schedule_id': scheduleId,
        'username': name,
        'qty_adult': countAdult.toString(),
        'qty_child': countChild.toString(),
        'seat': seats
      }),
    );
  }

  static Future<List<Ticket>> fetchTicket(String userId) async {
    final response =
        await http.get(Uri.parse('https://tipal.my.id/api_get_order.php'));

    if (response.statusCode == 200) {
      var decodedResponse = jsonDecode(response.body);

      return (decodedResponse as List).map((e) => Ticket.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load schedule');
    }
  }
}
