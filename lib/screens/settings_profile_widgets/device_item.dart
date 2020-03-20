import 'package:flutter/material.dart';

import '../common_widgets/responsive_padding.dart';        
import '../common_widgets/responsive_container.dart';        
import '../common_widgets/responsive_image.dart';        
import '../../styles/common_styles.dart';
import '../../styles/common_colors.dart';

class DeviceItem extends StatelessWidget {
  DeviceItem({
    this.deviceName
  });

  final String deviceName;

  @override
  Widget build(BuildContext context) {
    return ResponsivePadding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: new BoxDecoration(
          border: new Border(
            bottom: new BorderSide(
              width: 1.0,
              color: CommonColors.lightGray
            )
          ) 
        ),
        child: ResponsivePadding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: Row(
            children: <Widget>[
              ResponsiveContainer(
                width: 40.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.phone_android),
                  ]
                )
              ),
              Expanded(
                child: Text(
                  deviceName,
                  style: CommonStyles(context: context).getBlackNormalText()
                )
              ),
              InkWell(
                child: ResponsiveImage(
                  image: ExactAssetImage("images/icons/btn_close.png"),
                  width: 42.0,
                  height: 42.0
                ),
                onTap: () {}
              )
            ]
          )
        )
      )
    );
  }
}