import 'package:flutter/material.dart';
import '../../theme.dart';

class KchoiceChipWidget extends StatelessWidget {
  final bool selected;
  final String title;
  const KchoiceChipWidget(
      {Key? key, required this.selected, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
        disabledColor: kWhiteColor,
        selectedColor: kSecondaryColor.withOpacity(0.2),
        side: BorderSide(color: selected ? kSecondaryColor : kGreyColor),
        label: Text(
          title,
          style: whiteTextStyle.copyWith(
              color: selected ? kSecondaryColor : kGreyColor),
        ),
        selected: selected);
  }
}
