import 'package:flutter/material.dart';

import '../../config/application.dart';
import '../../config/routes.dart';

import '../common_widgets/responsive_padding.dart';
import '../common_widgets/responsive_image.dart';
import '../common_widgets/circle_image.dart';
import '../common_widgets/responsive_container.dart';
import '../common_widgets/rectangle_icon_button.dart';
import '../../styles/common_styles.dart';
import '../../styles/common_variables.dart';
import '../../styles/common_colors.dart';

class ProfileLessHeader extends StatelessWidget {
  ProfileLessHeader();

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
        Application.router.navigateTo(context, RouteConstants.ROUTE_HOME, clearStack: true);
      }
    ); 
  }

  Widget _rightButton(BuildContext context) {
    return InkWell(
      onTap: () {
        Application.router.navigateTo(context, RouteConstants.ROUTE_SETTINGS_PROFILE);
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
    return CircleImage(
      image: new ExactAssetImage('images/21.jpg'),
      width: 72.0,
      height: 72.0
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
              "Maike Silva",
              style: CommonStyles(context: context).getDarkGrayNormalSemiBoldText()
            )
          ),
          Text(
            "maikejo@gmail.com",
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
          RectangleIconButtonWidget(
            isLeftIcon: true,
            isFullWidth: true,
            bgColor: CommonColors.blue,
            text: "Ativar Conta",
            btnIcon: Icons.access_alarm,
            btnWidth: CommonVariables.defaultBtnWidth,
            btnHeight: CommonVariables.defaultBtnHeight,
            onPressed: () {
              Application.router.navigateTo(context, RouteConstants.ROUTE_PROFILE_PREMIUM);
            }
          ),
          _toggleProfileMore()
        ]
      )
    );
  }
}