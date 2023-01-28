import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tipal/items/ticket_item.dart';
import 'package:tipal/models/Ticket.dart';
import 'package:http/http.dart' as http;

class TicketsPage extends StatefulWidget {
  TicketsPage({Key? key}) : super(key: key);

  @override
  _TicketsPageState createState() => _TicketsPageState();
}

Future<List<Ticket>> fetchTicket(String userId) async {
  final response =
      await http.get(Uri.parse('https://tipal.my.id/api_get_order.php'));

  if (response.statusCode == 200) {
    var decodedResponse = jsonDecode(response.body);
    print(decodedResponse);
    return (decodedResponse as List).map((e) => Ticket.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load schedule');
  }
}

class _TicketsPageState extends State<TicketsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      width: double.infinity,
      decoration: const BoxDecoration(color: Color.fromRGBO(235, 235, 235, 1)),
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Your Tickets : ",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          FutureBuilder<List<Ticket>>(
            future: fetchTicket("user1"),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                    child: ListView(
                  children: snapshot.data!
                      .map((e) => new TicektItem(ticket: e))
                      .toList(),
                ));
              } else if (snapshot.hasError) {
                throw Exception("Failed To Load Ticket");
              }

              return CircularProgressIndicator();
            },
          )
        ],
      ),
    ));
  }
}
