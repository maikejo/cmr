import 'package:flutter/material.dart';

import '../common_widgets/responsive_padding.dart';
import '../common_widgets/responsive_container.dart';
import '../common_widgets/responsive_image.dart';
import '../../styles/common_colors.dart';
import '../../styles/common_variables.dart';

class ListWalletHeader extends StatelessWidget {
  ListWalletHeader({this.leftButton, this.rightButton});

  final Widget leftButton;
  final Widget rightButton;

  Widget _walletInformation(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "13,500.00",
          style: TextStyle(
            color: CommonColors.white,
            fontSize: 40.0,
            fontFamily: CommonVariables.defaultFont,
            fontWeight: FontWeight.normal
          )
        ),
        ResponsivePadding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(
            "Total Balance",
            style: TextStyle(
              color: CommonColors.lightWhite,
              fontSize: CommonVariables(context: context).getNormalFontSize(),
              fontFamily: CommonVariables.defaultFont,
              fontWeight: FontWeight.normal
            )
          )
        )
      ]
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: CommonColors.blue,
        boxShadow: [
          const BoxShadow(
            color: Colors.black12,
            blurRadius: 12.0,
            offset: Offset(0.0, 5.0)
          )
        ],
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(16.0),
          bottomLeft: Radius.circular(16.0)
        )
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: CommonVariables(context: context).getAppBarHeight(),
            padding: EdgeInsets.only(
              top: CommonVariables(context: context).getAppBarPaddingTop()
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ResponsiveContainer(
                  width: 100.0,
                  child: ResponsivePadding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Scaffold.of(context).openDrawer();
                          },
                          child: new ResponsivePadding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: new ResponsiveImage(
                              image: new ExactAssetImage("images/icons/ic_back_white.png"),
                              width: 24.0,
                              height: 17.0 
                            )
                          )
                        )
                      ]
                    )
                  )
                ),
                Text(
                  "Wallet",
                  style: TextStyle(
                    color: CommonColors.white,
                    fontSize: CommonVariables(context: context).getNormalFontSize(),
                    fontFamily: CommonVariables.defaultFont,
                    fontWeight: FontWeight.w600
                  )
                ),
                ResponsiveContainer(
                  width: 100.0,
                  child: ResponsivePadding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0)
                  )
                )
              ],
            )
          ),
          ResponsivePadding(
            padding: const EdgeInsets.only(top: 12.0, bottom: 29.0),
            child: _walletInformation(context)
          )
        ]
      )
    );
  }
}