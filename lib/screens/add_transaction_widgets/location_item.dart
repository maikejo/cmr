import 'package:flutter/material.dart';

import '../../model/location.dart';
import '../common_widgets/responsive_padding.dart';
import '../common_widgets/circle_image.dart';
import '../../styles/common_colors.dart';
import '../../styles/common_variables.dart';

class LocationItem extends StatelessWidget {
  LocationItem({this.location});

  final Location location;

  Widget build(BuildContext context) {
    return ResponsivePadding(
      padding: const EdgeInsets.all(8.0),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleImage(
              imageNetwork: new NetworkImage(this.location.icon),
              width: 40.0,
              height: 40.0
            ),
            ResponsivePadding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(
                children: <Widget>[
                  Text(
                    this.location.title,
                    style: TextStyle(
                      color: CommonColors.black,
                      fontSize: CommonVariables(context: context).getSmallFontSize(),
                      fontFamily: CommonVariables.defaultFont,
                      fontWeight: FontWeight.normal
                    )
                  ),
                  Text(
                    this.location.address,
                    style: TextStyle(
                      color: CommonColors.black,
                      fontSize: CommonVariables(context: context).getSmallFontSize(),
                      fontFamily: CommonVariables.defaultFont,
                      fontWeight: FontWeight.normal
                    )
                  )
                ],
              )
            )
          ]
        )
      )
    );
  }
}