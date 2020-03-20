import 'package:flutter/material.dart';

// import '../config/application.dart';
// import '../config/routes.dart';

import './common_widgets/finey_header.dart';
import './common_widgets/responsive_padding.dart';
import './settings_profile_widgets/avatar.dart';
import './settings_profile_widgets/device_item.dart';
import './settings_profile_widgets/information_card.dart';
import './settings_profile_widgets/general_item.dart';
import '../styles/common_variables.dart';
import '../styles/common_colors.dart';

class SettingsProfileScreen extends StatefulWidget {
  SettingsProfileScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SettingsProfileScreenState createState() => new _SettingsProfileScreenState();
}

class _SettingsProfileScreenState extends State<SettingsProfileScreen> {
  // Build Devices List
  Widget _buildDevices(BuildContext context) {
    return ResponsivePadding(
      padding: EdgeInsets.only(top: 16.0, bottom: 32.0, left: 16.0, right: 16.0),
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
            DeviceItem(
              deviceName: "No.12 iPhone X"
            ),
            DeviceItem(
              deviceName: "No.12 iPhone X"
            ),
            DeviceItem(
              deviceName: "No.12 iPhone X"
            )
          ]
        )
      )
    );
  }

  // Build General Items List 
  Widget _buildGeneralItems(BuildContext context) {
    return ResponsivePadding(
      padding: EdgeInsets.only(top: 16.0, bottom: 32.0, left: 16.0, right: 16.0),
      child: Container(
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
          children: <Widget>[
            GeneralItem(
              itemName: "Notification",
              imageIcon: "images/icons/ic_notification.png"
            ),
            GeneralItem(
              itemName: "Face ID",
              imageIcon: "images/icons/ic_faceid.png"
            )
          ]
        )
      )
    );
  }

  Widget _buildTitle(context, String title) {
    return ResponsivePadding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        title,
        style: TextStyle(
          color: CommonColors.gray,
          fontSize: CommonVariables(context: context).getSmallFontSize(),
          fontFamily: CommonVariables.defaultFont,
          fontWeight: FontWeight.w600
        )
      )
    );
  }

  Widget _buildWithConstraints(BuildContext context, BoxConstraints constraints) {
    var column = new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        FineyHeader(
          title: "Settings",
          leftImageIconButton: "images/icons/ic_back.png",
          leftImageIconButtonWidth: 24.0,
          leftImageIconButtonHeight: 17.0,
          onPressLeftButton: () {
            Navigator.of(context).pop();
          }
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Avatar(),
                ),
                InformationCard(),
                _buildTitle(context, "DEVICE 2/5"),
                _buildDevices(context),
                _buildTitle(context, "GENERAL"),
                _buildGeneralItems(context)
              ]
            )
          )
        )
      ]
    );

    var constrainedBox = new ConstrainedBox(
      constraints: constraints.copyWith(
        maxHeight: MediaQuery.of(context).size.height,
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