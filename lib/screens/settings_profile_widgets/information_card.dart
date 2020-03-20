import 'package:flutter/material.dart';

import '../../config/application.dart';
import '../../config/routes.dart';

import '../common_widgets/shadow_card.dart';
import '../common_widgets/responsive_padding.dart';
import '../common_widgets/responsive_image.dart';
import '../common_widgets/responsive_container.dart';
import '../../styles/common_styles.dart';

class InformationCard extends StatelessWidget {
  InformationCard();

  @override
  Widget build(BuildContext context) {
    return ShadowCardWidget(
      outerPadHorizontal: 16.0,
      outerPadVertical: 32.0,
      paddingVertical: 20.0,
      child: Row(
        children: <Widget>[
          ResponsiveContainer(
            width: 56.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ResponsiveImage(
                  image: new ExactAssetImage('images/icons/ic_user.png'),
                  width: 13.0,
                  height: 16.0
                )
              ],
            )
          ),
          Expanded(
            child: Text(
              "Information",
              style: CommonStyles(context: context).getBlackNormalText()
            )
          ),
          ResponsivePadding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: ResponsiveImage(
              image: new ExactAssetImage("images/icons/ic_arrow_right.png"),
              width: 8.0,
              height: 12.0
            )
          )
        ]
      ),
      onPressItem: (){
        Application.router.navigateTo(context, RouteConstants.ROUTE_INFORMATION);
      }
    );
  }
}