import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ReservationPage extends StatefulWidget {
  String scheduleId;
  ReservationPage({Key? key, required this.scheduleId}) : super(key: key);

  @override
  _ReservationPageState createState() => _ReservationPageState(this.scheduleId);
}

class _ReservationPageState extends State<ReservationPage> {
  String scheduleId;
  final nameTextController = TextEditingController();
  final childTextController = TextEditingController();
  final adultTextController = TextEditingController();

  String seats = "";

  _ReservationPageState(this.scheduleId);

  Future<http.Response> placeOrder() {
    return http.post(
      Uri.parse('https://tipalfais.000webhostapp.com/api_post_order.php'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'schedule_id': this.scheduleId,
        'username': nameTextController.text,
        'qty_adult': adultTextController.text,
        'qty_child': childTextController.text,
        'seat':seats
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Please fill required data below :",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16),
          ),
          TextFormField(
            controller: nameTextController,
            decoration: const InputDecoration(
                labelText: "Name", border: OutlineInputBorder()),
          ),
          Padding(padding: EdgeInsets.only(top: 8)),
          TextFormField(
            controller: adultTextController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                labelText: "Adult", border: OutlineInputBorder()),
          ),
          Padding(padding: EdgeInsets.only(top: 8)),
          TextFormField(
            controller: childTextController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                labelText: "Child", border: OutlineInputBorder()),
          ),
          Padding(padding: EdgeInsets.only(top: 8)),
          SizedBox(
              width: double.infinity,
              child: DropdownButtonFormField(
                  value: seats.isNotEmpty ? seats : null,
                  decoration: const InputDecoration(
                      labelText: "Seat", border: OutlineInputBorder()),
                  isExpanded: true,
                  items: <String>[
                    'A1',
                    'A2',
                    'A3',
                    'A4',
                    'A5',
                    'B1',
                    'B2',
                    'B3',
                    'B4',
                    'B5',
                    'C1',
                    'C2',
                    'C3',
                    'C4',
                    'C5'
                  ]
                      .map((e) => DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      seats = value.toString();
                    });
                  })),
          Padding(padding: EdgeInsets.only(top: 8)),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    placeOrder().then((value) {
                      if (value.statusCode == 200) {
                        Navigator.pop(context);
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Gagal, Ada Kesalahan"),
                          )
                        );
                      }
                    });
                  },
                  child: Text("Reserved")))
        ],
      ),
    )));
  }
}
