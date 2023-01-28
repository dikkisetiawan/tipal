import 'package:flutter/material.dart';
import 'package:tipal/main_page.dart';
import 'package:tipal/view/pages/home_page.dart';
import 'package:tipal/view/pages/login_page.dart';
import 'package:tipal/services/auth_services.dart';
import 'package:tipal/view/pages/search_result_page.dart';

import 'view/pages/my_tickets_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Roboto'),
      home: SearchResultPage(),
    );
  }
}
