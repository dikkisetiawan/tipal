import 'package:flutter/material.dart';
import 'package:tipal/view/widgets/adult_child_widget.dart';

import '../../theme.dart';
import '../widgets/ktext_form_field_widget.dart';

class ReservationPage extends StatefulWidget {
  final String scheduleId;

  ReservationPage({Key? key, required this.scheduleId}) : super(key: key);

  @override
  State<ReservationPage> createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  final fullNameTextController = TextEditingController();
  String seats = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Column(
        children: [
          Expanded(
            flex: 7,
            child: Container(
              decoration: const BoxDecoration(
                color: kPrimaryColor,
                image: DecorationImage(
                    alignment: Alignment.bottomCenter,
                    image: AssetImage('assets/Pattern.png'),
                    fit: BoxFit.fitWidth),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              decoration: const BoxDecoration(color: kWhiteColor),
            ),
          )
        ],
      ),
      ListView(
        padding: const EdgeInsets.all(defaultMargin),
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(height: defaultMargin * 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Reservation form',
                style:
                    titleTextStyle.copyWith(color: kWhiteColor, fontSize: 20),
              ),
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                    color: kWhiteColor.withOpacity(0.2),
                    shape: BoxShape.circle),
                child: const Icon(
                  Icons.document_scanner,
                  color: kWhiteColor,
                  size: 24,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: defaultMargin * 2,
          ),
          KtextFormFieldWidget(
              title: 'Full Name', controller: fullNameTextController),
          const SizedBox(
            height: defaultMargin,
          ),
          SizedBox(
              width: double.infinity,
              child: DropdownButtonFormField(
                  value: seats.isNotEmpty ? seats : null,
                  decoration: const InputDecoration(
                      hintText: 'Select Seat',
                      filled: true,
                      fillColor: kWhiteColor,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(width: 1, color: kGreyColor))),
                  isExpanded: true,
                  items: <String>[
                    'A1',
                    'A2',
                    'A3',
                    'A4',
                    'A5',
                    'B1',
                    'B2',
                    'B3',
                    'B4',
                    'B5',
                    'C1',
                    'C2',
                    'C3',
                    'C4',
                    'C5'
                  ]
                      .map((e) => DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      seats = value.toString();
                    });
                  })),
          const SizedBox(height: defaultMargin),
          const AdultChildWidget()
        ],
      )
    ]));
  }
}
