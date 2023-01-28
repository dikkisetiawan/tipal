import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tipal/view/pages/login_page.dart';

import '../theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            color: kPrimaryColor,
            image: DecorationImage(
                alignment: Alignment.bottomCenter,
                image: AssetImage('assets/Pattern.png'),
                fit: BoxFit.fitWidth),
          ),
        ),
        Column(
          children: [
            const SizedBox(height: defaultMargin * 5),
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                  color: kWhiteColor, shape: BoxShape.circle),
              child: Image.asset('assets/Logo.png'),
            ),
            const SizedBox(height: defaultMargin / 2),
            Center(
                child: Text(
              'Tipal',
              style: titleTextStyle.copyWith(color: kWhiteColor, fontSize: 32),
            )),
            const Spacer(),
            Text(
              'Plan your next voyage',
              style: titleTextStyle.copyWith(
                  color: kWhiteColor,
                  fontSize: 14,
                  fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: defaultMargin * 2),
          ],
        )
      ]),
    );
  }
}
