import 'package:flutter/material.dart';

import '../../theme.dart';

class KtextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  const KtextFormFieldWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(
          labelText: 'Username',
          hintText: 'input username',
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(width: 1, color: kGreyColor)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(width: 1, color: kGreyColor))),
    );
  }
}
