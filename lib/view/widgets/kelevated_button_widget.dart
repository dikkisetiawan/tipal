import 'package:flutter/material.dart';

import '../../theme.dart';

class KelevatedButtonWidget extends StatelessWidget {
  final String title;

  const KelevatedButtonWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(56),
            backgroundColor: kSecondaryColor),
        onPressed: () {},
        child: Text(title, style: whiteTextStyle));
  }
}
