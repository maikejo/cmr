import 'package:flutter/material.dart';

import '../common_widgets/responsive_padding.dart';
import '../common_widgets/selectable_item.dart';

class ChooseWalletForm extends StatelessWidget {
  ChooseWalletForm({
    this.onPressWallet,
    this.onPressFriend,
    this.onPressLocation
  });

  final Function onPressWallet;
  final Function onPressFriend;
  final Function onPressLocation;

  @override
  Widget build(BuildContext context) {
    return ResponsivePadding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
              imageIcon: "images/icons/ic_wallet.png",
              imageIconWidth: 24.0,
              imageIconHeight: 21.6,
              text: "Wallet",
              onPressItem: this.onPressWallet,
            ),
            SelectableItem(
              imageIcon: "images/icons/ic_friends.png",
              imageIconWidth: 24.0,
              imageIconHeight: 22.38,
              text: "Friend",
              onPressItem: this.onPressFriend,
            ),
            SelectableItem(
              imageIcon: "images/icons/ic_location.png",
              imageIconWidth: 16.0,
              imageIconHeight: 24.0,
              text: "Location",
              onPressItem: this.onPressLocation,
            )
          ]
        )
      )
    );
  }
}