import 'package:flutter/material.dart';

import '../../model/bank.dart';
import '../common_widgets/responsive_padding.dart';
import '../common_widgets/responsive_container.dart';
import '../common_widgets/responsive_image.dart';
import '../../styles/common_styles.dart';

class BankList extends StatelessWidget {
  BankList();

  final List<Bank> banks = [
    Bank(
      name: "Debit Card",
      image: "images/icons/ic_credit_card_large.png"
    ),
    Bank(
      name: "Credit Card",
      image: "images/icons/ic_credit_card_large.png"
    ),
    Bank(
      name: "Bank Account",
      image: "images/icons/ic_credit_card_large.png"
    ),
    Bank(
      name: "Money Cash",
      image: "images/icons/ic_credit_card_large.png"
    )
  ];

  Widget _bankItem(BuildContext context, int index) {
    return ResponsivePadding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 32.0),
      child: ResponsiveContainer(
        width: 120.0,
        height: 120.0,
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(const Radius.circular(6.0)),
          boxShadow: [
            const BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
              offset: Offset(0.0, 4.0)
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ResponsiveImage(
              image: new ExactAssetImage(banks[index].image),
              width: 48.0,
              height: 36.0
            ),
            ResponsivePadding(
              padding: const EdgeInsets.only(top: 27.0),
              child: Text(
                banks[index].name,
                style: CommonStyles(context: context).getGrayNormalText()
              )
            )
          ]
        )
      )
    );
  }

  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 12.0),
      itemCount: banks.length,
      itemBuilder: _bankItem,
    );
  }
}