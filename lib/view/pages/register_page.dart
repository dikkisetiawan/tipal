import 'package:flutter/material.dart';
import 'package:tipal/theme.dart';
import 'package:tipal/view/pages/home_page.dart';
import 'package:tipal/view/pages/login_page.dart';

import '../../services/auth_services.dart';
import '../widgets/kelevated_button_widget.dart';
import '../widgets/ktext_form_field_widget.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final userNameTextController = TextEditingController();
  final passwordTextController = TextEditingController();

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
                      'Sign Up',
                      style: titleTextStyle,
                    ),
                    const SizedBox(height: defaultMargin),
                    KtextFormFieldWidget(
                      title: 'Username',
                      controller: userNameTextController,
                    ),
                    const SizedBox(height: defaultMargin / 2),
                    KtextFormFieldWidget(
                      title: 'Password',
                      controller: passwordTextController,
                    ),
                    const SizedBox(height: defaultMargin),
                    KelevatedButtonWidget(
                        onPressed: () {
                          AuthServices.register(
                                  username: userNameTextController.text,
                                  password: passwordTextController.text)
                              .then((value) {
                            return Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()));
                            ;
                          }).onError((error, stackTrace) =>
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text('Error: $error'),
                                    backgroundColor: Colors.red.shade300,
                                  )));
                        },
                        title: 'Sign Up'),
                    const SizedBox(height: defaultMargin / 2),
                    Center(
                      child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Forgot Password?',
                            style: buttonTextStyle,
                          )),
                    ),
                    const SizedBox(height: defaultMargin / 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an account?',
                          style: greyTextStyle,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            },
                            child: const Text(
                              'Sign In',
                              style: buttonTextStyle,
                            ))
                      ],
                    )
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
