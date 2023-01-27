// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:tipal/items/schedule_item.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:tipal/models/Harbour.dart';
import 'package:tipal/models/Schedule.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String fromStation;
  late String toStation;
  late Future<List<Harbour>> listHarbour;
  late List<Schedule> listSchedule;

  Future<List<Harbour>> fetchHarbour() async {
    final response = await http.get(
        Uri.parse('https://tipalfais.000webhostapp.com/api_get_harbor.php'));

    if (response.statusCode == 200) {
      var decodedResponse = jsonDecode(response.body);
      print(decodedResponse);
      return (decodedResponse as List).map((e) => Harbour.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load harbour');
    }
  }

  Future<List<Schedule>> fetchSchedule(String from, String to) async {
    final response = await http.get(Uri.parse(
        'https://tipalfais.000webhostapp.com/api_get_schedule.php?harbor_from=${from}&harbor_to=${to}'));

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listHarbour = fetchHarbour();
    listSchedule = <Schedule>[];
    fromStation = "";
    toStation = "";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
          child: FutureBuilder<List<Harbour>>(
        future: listHarbour,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              decoration:
                  const BoxDecoration(color: Color.fromRGBO(235, 235, 235, 1)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        const Text("Where do you \nwant to go?",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold)),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Image.asset('assets/images/user_icon.png'),
                        ),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.only(top: 24)),
                    Container(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "From : ",
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                              width: double.infinity,
                              child: DropdownButton(
                                  value: fromStation.isNotEmpty
                                      ? fromStation
                                      : null,
                                  isExpanded: true,
                                  items: snapshot.data!
                                      .map((e) => DropdownMenuItem(
                                            child: Text(e.harborName),
                                            value: e.harborId,
                                          ))
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      print(value);
                                      fromStation = value.toString();
                                    });
                                  })),
                          Padding(padding: EdgeInsets.only(top: 16)),
                          Text(
                            "To : ",
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                              width: double.infinity,
                              child: DropdownButton(
                                  value:
                                      toStation.isNotEmpty ? toStation : null,
                                  isExpanded: true,
                                  items: snapshot.data!
                                      .map((e) => DropdownMenuItem(
                                            child: Text(e.harborName),
                                            value: e.harborId,
                                          ))
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      print(value);
                                      toStation = value.toString();
                                    });
                                  })),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Color.fromRGBO(253, 198, 32, 1)),
                              onPressed: () {
                                fetchSchedule(fromStation, toStation)
                                    .then((value) {
                                  setState(() {
                                    listSchedule = value;
                                  });
                                });
                              },
                              child: Text("Search"),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 16)),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text("Available tickets :",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                    Padding(padding: EdgeInsets.only(top: 16)),
                    Expanded(
                      child: ListView(
                        children: listSchedule
                            .map((e) => ScheduleItem(schedule: e))
                            .toList(),
                      ),
                    )
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {}

          return CircularProgressIndicator();
        },
      )),
    );
  }
}
