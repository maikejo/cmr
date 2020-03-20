import 'package:flutter/material.dart';

import '../common_widgets/responsive_padding.dart';
import '../common_widgets/selectable_item.dart';

class CreateWalletForm extends StatelessWidget {
  CreateWalletForm({this.onPressCurrency, this.onPressName, this.onPressMoney});

  final Function onPressCurrency;
  final Function onPressName;
  final Function onPressMoney;

  @override
  Widget build(BuildContext context) {
    return ResponsivePadding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Container(
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(const Radius.circular(6.0)),
          boxShadow: [
            const BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
              offset: Offset(0.0, 4.0)
            )
          ]
        ),
        child: Column(
          children: <Widget>[
            SelectableItem(
              imageIcon: "images/icons/ic_memo.png",
              imageIconWidth: 18.0,
              imageIconHeight: 14.5,
              text: "Name wallet",
              onPressItem: this.onPressName,
            ),
            SelectableItem(
              imageIcon: "images/icons/ic_curency.png",
              imageIconWidth: 24.0,
              imageIconHeight: 18.0,
              text: "Currency",
              onPressItem: this.onPressCurrency
            ),
            SelectableItem(
              imageIcon: "images/icons/ic_amount.png",
              imageIconWidth: 24.0,
              imageIconHeight: 22.0,
              text: "100,000.00",
              onPressItem: this.onPressMoney
            )
          ]
        )
      )
    );
  }
}