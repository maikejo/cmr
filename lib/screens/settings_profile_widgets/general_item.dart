import 'package:flutter/material.dart';

import '../common_widgets/responsive_padding.dart';        
import '../common_widgets/responsive_image.dart';        
import '../common_widgets/responsive_container.dart';        
import '../../styles/common_styles.dart';
import '../../styles/common_colors.dart';

class GeneralItem extends StatelessWidget {
  GeneralItem({
    this.imageIcon,
    this.itemName
  });

  final String imageIcon;
  final String itemName;

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
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ResponsiveContainer(
                width: 40.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ResponsiveImage(
                      image: new ExactAssetImage(imageIcon),
                      width: 24.0,
                      height: 24.0
                    )
                  ]
                )
              ),
              Expanded(
                child: Text(
                  itemName,
                  style: CommonStyles(context: context).getBlackNormalText()
                )
              ),
              Switch(
                onChanged: (value) {},
                value: true
              ) 
            ]
          )
        )
      )
    );
  }
}