import 'package:flutter/material.dart';

import './common_widgets/finey_header.dart';
import './common_widgets/responsive_padding.dart';
import './common_widgets/rectangle_icon_button.dart';
import './common_widgets/circle_avatar_with_icon.dart';
import './information_widgets/setting_form.dart';
import '../styles/common_variables.dart';
import '../styles/common_colors.dart';

class InformationScreen extends StatefulWidget {
  InformationScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _InformationScreenState createState() => new _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  Widget _buildWithConstraints(BuildContext context, BoxConstraints constraints) {
    var column = new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        FineyHeader(
          title: "Information",
          leftImageIconButton: "images/icons/ic_back.png",
          leftImageIconButtonWidth: 24.0,
          leftImageIconButtonHeight: 17.0,
          rightImageIconButton: "images/icons/ic_done.png",
          rightImageIconButtonWidth: 24.0,
          rightImageIconButtonHeight: 16.0,
          onPressLeftButton: () {
            Navigator.of(context).pop();
          }
        ),
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ResponsivePadding(
                padding: const EdgeInsets.only(top: 24.0),
                child: CircleAvatarWithIcon(
                  image: new ExactAssetImage('images/21.jpg'),
                  icon: Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                    size: 18.0,
                  ),
                  iconBgColor: CommonColors.gray,
                  bottom: 0.0,
                  right: 0.0
                )
              ),
              ResponsivePadding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 32.0),
                child: SettingForm()
              ),
              RectangleIconButtonWidget(
                isLeftIcon: true,
                isFullWidth: true,
                bgColor: CommonColors.blue,
                text: "Go Premium",
                btnIcon: Icons.access_alarm,
                btnWidth: CommonVariables.defaultBtnWidth,
                btnHeight: CommonVariables.defaultBtnHeight,
                onPressed: () {}
              )
            ]
          )
        )
      ]
    );

    var constrainedBox = new ConstrainedBox(
      constraints: constraints.copyWith(
        maxHeight: MediaQuery.of(context).size.height
      ),
      child: new Container(
        color: Colors.white,
        padding: EdgeInsets.only(bottom: CommonVariables(context: context).getScreenPaddingBottom()),
        child: column
      )
    );

    var scrollView = new SingleChildScrollView(
      child: constrainedBox
    );

    return scrollView;
  }

  @override
  Widget build(BuildContext context) {
    var layoutBuilder = new LayoutBuilder(
      builder: _buildWithConstraints
    );

    var scaffold = new Scaffold(
      body: layoutBuilder
    );

    return scaffold;
  }
}