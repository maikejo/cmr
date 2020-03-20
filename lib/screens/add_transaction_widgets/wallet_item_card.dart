import 'package:flutter/material.dart';

import '../common_widgets/shadow_card.dart';
import '../common_widgets/responsive_padding.dart';
import '../common_widgets/responsive_container.dart';
import '../../styles/common_styles.dart';
import '../../styles/common_colors.dart';

class WalletItemCard extends StatelessWidget {
  WalletItemCard({
    this.type,
    this.information,
    this.money,
    this.moneyTextStyle
  });

  final String type;
  final String information;
  final String money;
  final TextStyle moneyTextStyle;

  Widget _buildWalletIcon(BuildContext context) {
    return ResponsiveContainer(
      width: 68.0,
      decoration: new BoxDecoration(
        border: Border(
          right: BorderSide(width: 1.0, color: CommonColors.lightGray)
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Icon(
            Icons.credit_card,
            color: CommonColors.blue,
            size: 30.0
          )
        ]
      )
    );
  }

  Widget _buildWalletInformation(BuildContext context) {
    return Expanded(
      child: ResponsivePadding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ResponsivePadding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                type,
                style: CommonStyles(context: context).getBlackNormalText()
              )
            ),
            new Text(
              information,
              style: CommonStyles(context: context).getGrayNormalText()
            )
          ]
        )
      )
    );
  }

  Widget _buildWalletMoney(BuildContext context) {
    return ResponsivePadding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        money,
        style: moneyTextStyle
      )
    );
  }

  Widget build(BuildContext context) {
    return ShadowCardWidget(
      outerPadVertical: 12.0,
      outerPadHorizontal: 16.0,
      paddingVertical: 16.0,
      child: Row(
        children: <Widget>[
          _buildWalletIcon(context),
          _buildWalletInformation(context),
          _buildWalletMoney(context)
        ]
      ),
      onPressItem: () {}
    );
  }
}