import 'package:flutter/material.dart';

import '../../model/category.dart';
import '../common_widgets/responsive_padding.dart';
import '../common_widgets/circle_image.dart';
import '../../styles/common_colors.dart';
import '../../styles/common_variables.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({this.category});

  final Category category;

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
              imageNetwork: new NetworkImage(this.category.icon),
              width: 40.0,
              height: 40.0
            ),
            ResponsivePadding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                this.category.title,
                style: TextStyle(
                  color: CommonColors.black,
                  fontSize: CommonVariables(context: context).getSmallFontSize(),
                  fontFamily: CommonVariables.defaultFont,
                  fontWeight: FontWeight.normal
                ) 
              )
            )
          ]
        )
      )
    );
  }
}