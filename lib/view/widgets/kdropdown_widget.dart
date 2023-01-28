import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:tipal/theme.dart';

import '../../models/Harbour.dart';

class KdropdownWidget extends StatefulWidget {
  final List<Harbour> harbourList;
  final void Function(String? value)? onChanged;
  final String? selectedValue;

  const KdropdownWidget(
      {Key? key, required this.harbourList, this.onChanged, this.selectedValue})
      : super(key: key);

  @override
  State<KdropdownWidget> createState() => _KdropdownWidgetState();
}

class _KdropdownWidgetState extends State<KdropdownWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        hint: Row(
          children: const [
            Icon(
              Icons.list,
              size: 16,
              color: kGreyColor,
            ),
            SizedBox(
              width: defaultMargin / 2,
            ),
            Expanded(
              child: Text(
                'Select Item',
                style: greyTextStyle,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        items: widget.harbourList
            .map((item) => DropdownMenuItem<String>(
                  value: item.harborId,
                  child: Text(
                    item.harborName,
                    style: blackTextStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                ))
            .toList(),
        value: widget.selectedValue,
        onChanged: widget.onChanged,
        icon: const Icon(
          Icons.arrow_forward_ios_outlined,
        ),
        iconSize: 14,
        iconEnabledColor: Colors.yellow,
        iconDisabledColor: Colors.grey,
        buttonHeight: 50,
        buttonWidth: 160,
        buttonPadding: const EdgeInsets.only(left: 14, right: 14),
        buttonDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: Colors.black26,
          ),
          color: kWhiteColor,
        ),
        buttonElevation: 2,
        itemHeight: 40,
        itemPadding: const EdgeInsets.only(left: 14, right: 14),
        dropdownMaxHeight: 400,
        dropdownWidth: double.infinity,
        dropdownPadding: null,
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: kWhiteColor,
        ),
        dropdownElevation: 8,
        scrollbarRadius: const Radius.circular(40),
        scrollbarThickness: 6,
        scrollbarAlwaysShow: true,
        offset: const Offset(-20, 0),
      ),
    );
  }
}
