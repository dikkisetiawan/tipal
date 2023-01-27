import 'package:flutter/material.dart';
import 'package:tipal/theme.dart';

import '../view/widgets/ktext_form_field_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Stack(
        children: [
          Positioned(
            right: 0,
            left: 0,
            top: 150,
            child: Image.asset('assets/Pattern.png', fit: BoxFit.cover),
          ),
          ListView(children: [
            const SizedBox(height: defaultMargin * 2),
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
            Container(
              margin: const EdgeInsets.only(top: defaultMargin * 2),
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(defaultMargin),
                      topRight: Radius.circular(defaultMargin))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: defaultMargin / 2),
                    Center(
                        child: Container(
                      width: 24,
                      height: 4,
                      decoration: const BoxDecoration(
                          color: kLightBlue,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                    )),
                    const SizedBox(height: defaultMargin),
                    const Text(
                      'Sign In',
                      style: titleTextStyle,
                    ),
                    const SizedBox(height: defaultMargin),
                    const KtextFormFieldWidget(),
                    const SizedBox(height: defaultMargin / 2),
                    const KtextFormFieldWidget(),
                    const SizedBox(height: defaultMargin),
                    ElevatedButton(style: ButtonStyle.styleFrom(minimumSize: ),onPressed: () {}, child: Text('juf'))
                  ],
                ),
              ),
            )
          ]),
        ],
      ),
    );
  }
}
