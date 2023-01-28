import 'package:flutter/material.dart';
import 'package:tipal/theme.dart';

import '../widgets/kchoice_chip_widget.dart';

class MyTicketsPage extends StatelessWidget {
  const MyTicketsPage({Key? key}) : super(key: key);

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
          'My Tickets',
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
                  KchoiceChipWidget(selected: true, title: 'All'),
                  SizedBox(width: defaultMargin / 3),
                  KchoiceChipWidget(selected: false, title: 'Open'),
                  SizedBox(width: defaultMargin / 3),
                  KchoiceChipWidget(selected: false, title: 'Completed')
                ],
              ),
            ),
            preferredSize: const Size.fromHeight(52)),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: defaultMargin / 2),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(top: defaultMargin / 2),
            padding: const EdgeInsets.all(defaultMargin / 2),
            decoration: BoxDecoration(
                color: kGreyColor.withOpacity(0.2),
                borderRadius:
                    const BorderRadius.all(Radius.circular(defaultMargin))),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(defaultMargin / 2),
                  decoration: const BoxDecoration(
                      color: kWhiteColor, shape: BoxShape.circle),
                  child: const Icon(
                    Icons.airplane_ticket_rounded,
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
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '#CREEASUGBF',
                          style: greyTextStyle.copyWith(
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Full Name',
                            style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          Text(
                            'Anton',
                            style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Seats',
                            style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          Text(
                            'Anton',
                            style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Child',
                            style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          Text(
                            'Anton',
                            style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Adults',
                            style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          Text(
                            'Anton',
                            style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
