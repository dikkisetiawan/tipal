import 'package:flutter/material.dart';
import 'package:tipal/theme.dart';
import 'package:tipal/view/widgets/kdropdown_widget.dart';

import '../widgets/kelevated_button_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
              padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
              child: KdropdownWidget(),
            ),
            const SizedBox(height: defaultMargin),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
              child: KdropdownWidget(),
            ),
            Card(
              margin: const EdgeInsets.all(defaultMargin),
              elevation: 10,
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(defaultMargin / 4))),
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
                    counterRowWidget(),
                    const SizedBox(
                      height: defaultMargin / 2,
                    ),
                    counterRowWidget()
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: KelevatedButtonWidget(title: 'Search'),
            ),
            const SizedBox(height: defaultMargin),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Text(
                'Quick Trip',
                style: titleTextStyle.copyWith(fontSize: 18, color: kGreyColor),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Surabaya - Merak',
                                  style: whiteTextStyle.copyWith(fontSize: 16),
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
        )
      ]),
    );
  }

  Row counterRowWidget() {
    return Row(
      children: [
        const Icon(
          Icons.person,
          color: kSecondaryColor,
        ),
        const Spacer(),
        Text(
          'Passenger',
          style: titleTextStyle.copyWith(fontSize: 14),
        ),
        const Spacer(
          flex: 7,
        ),
        customButtonWidget(),
        const Spacer(),
        Text(
          '0',
          style: titleTextStyle.copyWith(fontSize: 14),
        ),
        const Spacer(),
        customButtonWidget(),
      ],
    );
  }

  Widget customButtonWidget() {
    return InkWell(
      onTap: () {},
      highlightColor: kPrimaryColor,
      child: Container(
        clipBehavior: Clip.hardEdge,
        width: 24,
        height: 24,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(const Radius.circular(8)),
            color: Colors.transparent,
            border: Border.all(color: kSecondaryColor)),
        child: const Center(
            child: Text(
          '-',
          style: TextStyle(color: kSecondaryColor),
        )),
      ),
    );
  }
}
