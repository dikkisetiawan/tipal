import 'package:flutter/material.dart';
import 'package:tipal/theme.dart';
import 'package:tipal/view/widgets/kdropdown_widget.dart';

import '../../models/Harbour.dart';
import '../../models/Schedule.dart';
import '../../services/schedule_services.dart';
import '../widgets/adult_child_widget.dart';
import '../widgets/kelevated_button_widget.dart';
import 'search_result_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String fromStation;
  late String toStation;
  late Future<List<Harbour>> listHarbour;
  late List<Schedule> listSchedule;

  @override
  void initState() {
    super.initState();
    listHarbour = ScheduleServices.fetchHarbour();
    listSchedule = <Schedule>[];
    fromStation = "";
    toStation = "";
  }

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
        FutureBuilder<List<Harbour>>(
          future: listHarbour,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: defaultMargin,
                        right: defaultMargin,
                        top: defaultMargin,
                        bottom: defaultMargin * 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Where do you \nwanna go?',
                          style: titleTextStyle.copyWith(
                              color: kWhiteColor, fontSize: 20),
                        ),
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                              color: kWhiteColor.withOpacity(0.2),
                              shape: BoxShape.circle),
                          child: const Icon(
                            Icons.navigation,
                            color: kWhiteColor,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: KdropdownWidget(
                      harbourList: snapshot.data!,
                      selectedValue:
                          fromStation.isNotEmpty ? fromStation : null,
                      onChanged: (value) {
                        setState(() {
                          fromStation = value as String;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: defaultMargin),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: KdropdownWidget(
                      harbourList: snapshot.data!,
                      selectedValue: toStation.isNotEmpty ? toStation : null,
                      onChanged: (value) {
                        setState(() {
                          toStation = value as String;
                        });
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(defaultMargin),
                    child: AdultChildWidget(),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: KelevatedButtonWidget(
                      title: 'Search',
                      onPressed: () {
                        if (fromStation.isNotEmpty && toStation.isNotEmpty) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchResultPage(
                                      fromStation: fromStation,
                                      toStation: toStation)));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: const Text(
                                'Harap mengisi destination dengan lengkap'),
                            backgroundColor: Colors.red.shade300,
                          ));
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: defaultMargin),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: Text(
                      'Quick Trip',
                      style: titleTextStyle.copyWith(
                          fontSize: 18, color: kGreyColor),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 160,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Card(
                            color: kPrimaryColor,
                            margin: const EdgeInsets.only(
                                top: defaultMargin / 2, left: defaultMargin),
                            elevation: 10,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(defaultMargin / 4))),
                            child: Padding(
                              padding: const EdgeInsets.all(defaultMargin),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Surabaya - Merak',
                                        style: whiteTextStyle.copyWith(
                                            fontSize: 16),
                                      ),
                                      const SizedBox(
                                        height: defaultMargin / 2,
                                      ),
                                      Text(
                                        'Start Rp 230.000',
                                        style: whiteTextStyle.copyWith(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 12),
                                      )
                                    ],
                                  ),
                                  const SizedBox(width: defaultMargin * 2),
                                  const Icon(
                                    Icons.navigation,
                                    color: kWhiteColor,
                                    size: 24,
                                  )
                                ],
                              ),
                            ));
                      },
                    ),
                  ),
                  const SizedBox(height: defaultMargin * 8),
                ],
              );
            } else if (snapshot.hasError) {
              return const Center(
                  child: Text(
                'Failed to load harbour data',
                style: whiteTextStyle,
              ));
            }
            return const CircularProgressIndicator(
              color: kSecondaryColor,
            );
          },
        )
      ]),
    );
  }
}
