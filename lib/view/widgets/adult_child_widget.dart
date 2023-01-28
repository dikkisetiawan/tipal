import 'package:flutter/material.dart';

import '../theme.dart';

int countAdult = 0;
int countChild = 0;

class AdultChildWidget extends StatefulWidget {
  const AdultChildWidget({Key? key}) : super(key: key);

  @override
  State<AdultChildWidget> createState() => _AdultChildWidgetState();
}

class _AdultChildWidgetState extends State<AdultChildWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(defaultMargin / 4))),
      child: Padding(
        padding: const EdgeInsets.all(defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Passenger',
              style: titleTextStyle.copyWith(fontSize: 14),
            ),
            const SizedBox(
              height: defaultMargin,
            ),
            counterRowWidget(adult: true),
            const SizedBox(
              height: defaultMargin / 2,
            ),
            counterRowWidget(adult: false)
          ],
        ),
      ),
    );
  }

  Row counterRowWidget({required bool adult}) {
    return Row(
      children: [
        const Icon(
          Icons.person,
          color: kSecondaryColor,
        ),
        const Spacer(),
        Text(
          adult ? 'Adult' : 'Child',
          style: titleTextStyle.copyWith(fontSize: 14),
        ),
        const Spacer(
          flex: 7,
        ),
        counterWidget(adult: adult, increment: false),
        const Spacer(),
        Text(
          adult ? countAdult.toString() : countChild.toString(),
          style: titleTextStyle.copyWith(fontSize: 14),
        ),
        const Spacer(),
        counterWidget(adult: adult, increment: true),
      ],
    );
  }

  Widget counterWidget({required bool adult, required bool increment}) {
    return InkWell(
      onTap: () {
        if (increment) {
          if (adult) {
            setState(() {
              countAdult++;
            });
          } else {
            setState(() {
              countChild++;
            });
          }
        } else {
          if (adult) {
            setState(() {
              if (countAdult > 0) {
                countAdult--;
              }
            });
          } else {
            setState(() {
              if (countChild > 0) {
                countChild--;
              }
            });
          }
        }
      },
      highlightColor: kPrimaryColor,
      child: Container(
        clipBehavior: Clip.hardEdge,
        width: 24,
        height: 24,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            color: Colors.transparent,
            border: Border.all(color: kSecondaryColor)),
        child: Center(
            child: Text(
          increment ? '+' : '-',
          style: const TextStyle(color: kSecondaryColor),
        )),
      ),
    );
  }
}
