import 'package:flutter/material.dart';
import 'package:tipal/theme.dart';

import '../../models/Schedule.dart';
import '../../services/schedule_services.dart';
import '../widgets/kchoice_chip_widget.dart';

class SearchResultPage extends StatelessWidget {
  final String fromStation;
  final String toStation;
  const SearchResultPage(
      {Key? key, required this.fromStation, required this.toStation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: kWhiteColor,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(
          'Search Result',
          style: titleTextStyle.copyWith(fontSize: 16),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.filter_list,
                color: kGreyColor,
              ))
        ],
        bottom: PreferredSize(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Row(
                children: const [
                  KchoiceChipWidget(selected: true, title: 'All Vessel'),
                  SizedBox(width: defaultMargin / 3),
                  KchoiceChipWidget(selected: false, title: 'First Class'),
                  SizedBox(width: defaultMargin / 3),
                  KchoiceChipWidget(selected: false, title: 'Economy')
                ],
              ),
            ),
            preferredSize: const Size.fromHeight(52)),
      ),
      body: FutureBuilder<List<Schedule>>(
        future: ScheduleServices.fetchSchedule(fromStation, toStation),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding:
                  const EdgeInsets.symmetric(horizontal: defaultMargin / 2),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.only(top: defaultMargin / 2),
                    padding: const EdgeInsets.all(defaultMargin / 2),
                    decoration: BoxDecoration(
                        color: kGreyColor.withOpacity(0.2),
                        borderRadius: const BorderRadius.all(
                            Radius.circular(defaultMargin))),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(defaultMargin / 3),
                          decoration: const BoxDecoration(
                              color: kWhiteColor, shape: BoxShape.circle),
                          child: const Icon(
                            Icons.discount_rounded,
                            color: kSecondaryColor,
                            size: 25,
                          ),
                        ),
                        const SizedBox(
                          width: defaultMargin / 2,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Ferry ${snapshot.data![index].scheduleId} - Economy Class',
                                        style: blackTextStyle.copyWith(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: defaultMargin / 4,
                                      ),
                                      Text(
                                        snapshot.data![index].scheduleTime,
                                        style: greyTextStyle.copyWith(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Text(
                                    'Rp. ${snapshot.data![index].price}',
                                    style: blackTextStyle.copyWith(
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Center(
                child: Text(
              'Failed to load Schedule data',
              style: whiteTextStyle,
            ));
          }
          return const CircularProgressIndicator(
            color: kSecondaryColor,
          );
        },
      ),
    );
  }
}
