import 'package:flutter/material.dart';

import '../../theme.dart';

class KtextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;

  final String title;
  const KtextFormFieldWidget({
    Key? key,
    required this.controller,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          filled: true,
          fillColor: kWhiteColor,
          labelText: title,
          hintText: 'input $title',
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(width: 1, color: kGreyColor)),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(width: 1, color: kGreyColor))),
    );
  }
}
