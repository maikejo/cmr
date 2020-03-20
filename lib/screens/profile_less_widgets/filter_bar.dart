import 'package:flutter/material.dart';

import '../common_widgets/responsive_padding.dart';
import '../../styles/common_styles.dart';

class FilterBar extends StatelessWidget {
  FilterBar();

  @override
  Widget build(BuildContext context) {
    return ResponsivePadding(
      padding: const EdgeInsets.only(bottom: 24.0, right: 16.0, left: 16.0),
      child: Row(
        children: <Widget>[
          ResponsivePadding(
            padding: const EdgeInsets.only(right: 32.0),
            child: new InkWell(
              onTap: () => {},
              child: Text(
                "ALL TIME",
                style: CommonStyles(context: context).getGraySmallText()
              )
            )
          ),
          ResponsivePadding(
            padding: const EdgeInsets.only(right: 32.0),
            child: new InkWell(
              onTap: () => {},
              child: Text(
                "2017",
                style: CommonStyles(context: context).getGraySmallText()
              )
            ) 
          ),
          new InkWell(
            onTap: () => {},
            child: Text(
              "DECEMBER",
              style: CommonStyles(context: context).getGraySmallText()
            )
          )
        ]
      )
    );
  }
}