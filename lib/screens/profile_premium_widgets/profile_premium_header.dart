import 'package:flutter/material.dart';

import '../common_widgets/responsive_padding.dart';
import '../common_widgets/responsive_image.dart';
import '../common_widgets/circle_avatar_with_icon.dart';
import '../common_widgets/responsive_container.dart';
import '../../styles/common_styles.dart';
import '../../styles/common_variables.dart';
import '../../styles/common_colors.dart';

class ProfilePremiumHeader extends StatelessWidget {
  ProfilePremiumHeader();

  Widget _leftButton(BuildContext context) {
    return InkWell(
      child: new ResponsivePadding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: new ResponsiveImage(
          image: new ExactAssetImage("images/icons/ic_back.png"),
          width: 24.0,
          height: 17.0
        )
      ),
      onTap: () {
        Navigator.of(context).pop();
      }
    ); 
  }

  Widget _rightButton(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: new ResponsivePadding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: new ResponsiveImage(
          image: new ExactAssetImage("images/icons/ic_settings.png"),
          width: 24.0,
          height: 24.0
        )
      )
    ); 
  }

  Widget _profileAvatar() {
    return CircleAvatarWithIcon(
      image: new ExactAssetImage('images/21.jpg'),
      icon: Icon(
        Icons.ac_unit,
        color: Colors.white,
        size: 18.0
      ),
      iconBgColor: CommonColors.blue,
      right: 0.0,
      top: 0.0
    );
  }

  Widget _profileInformation(BuildContext context) {
    return ResponsivePadding(
      padding: const EdgeInsets.only(bottom: 19.0),
      child: Column(
        children: <Widget>[
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

  Widget _toggleProfileMore() {
    return ResponsivePadding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Center(
        child: InkWell(
          child: ResponsiveImage(
            image: new ExactAssetImage("images/icons/ic_arrow_down.png"),
            width: 17.0,
            height: 12.0,
          ),
          onTap: () {}
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      width: deviceWidth,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          const BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(0.0, 4.0)
          ),
        ],
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(8.0),
          bottomLeft: Radius.circular(8.0)
        )
      ),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              ResponsiveContainer(
                height: CommonVariables(context: context).getAppBarHeight()/2 + 80.0,
                child: Row(
                  children: <Widget>[
                    Container(
                      height: CommonVariables(context: context).getAppBarHeight(),
                      width: deviceWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          _leftButton(context),
                          _rightButton(context)
                        ]
                      )
                    )
                  ]
                )
              ),
              Positioned.fill(
                top: CommonVariables(context: context).getAppBarHeight()/2,
                child: Center(
                  child: _profileAvatar()
                )
              )
            ]
          ),
          _profileInformation(context),
          _toggleProfileMore()
        ]
      )
    );
  }
}