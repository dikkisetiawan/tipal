import 'package:flutter/material.dart';

import '../../theme.dart';

class KtextFormFieldWidget extends StatelessWidget {
  const KtextFormFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
