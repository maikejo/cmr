import 'package:flutter/material.dart';

import '../common_widgets/responsive_padding.dart';
import '../common_widgets/circle_avatar_with_icon.dart';
import '../../styles/common_colors.dart';
import '../../styles/common_styles.dart';

class Avatar extends StatelessWidget {
  Avatar();

  @override
  Widget build(BuildContext context) {
    return ResponsivePadding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Column(
        children: <Widget>[
          CircleAvatarWithIcon(
            right: 0.0,
            top: 0.0,
            image: new ExactAssetImage('images/21.jpg'),
            icon: Icon(
              Icons.all_inclusive,
              color: Colors.white,
              size: 18.0,
            ),
            iconBgColor: CommonColors.blue
          ),
          ResponsivePadding(
            padding: const EdgeInsets.only(top: 19.0, bottom: 6.0),
            child: Text(
              "Amanda Salazar",
              style: CommonStyles(context: context).getDarkGrayNormalSemiBoldText()
            )
          ),
          Text(
            "Designer",
            style: CommonStyles(context: context).getGraySmallText()
          )
        ]
      )
    );
  }
}