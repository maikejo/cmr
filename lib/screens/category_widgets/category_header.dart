import 'package:flutter/material.dart';

import '../../model/category.dart';
import '../../config/application.dart';
import '../../config/routes.dart';
import '../common_widgets/responsive_padding.dart';
import '../common_widgets/responsive_container.dart';
import '../common_widgets/responsive_image.dart';
import '../../styles/common_colors.dart';
import '../../styles/common_variables.dart';
import '../../styles/common_styles.dart';

class CategoryHeader extends StatelessWidget {
  CategoryHeader({
    this.category
  });

  final Category category;

  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          const BoxShadow(
            color: Colors.black12,
            blurRadius: 12.0,
            offset: Offset(0.0, 5.0)
          )
        ]
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: CommonVariables(context: context).getAppBarHeight(),
            padding: EdgeInsets.only(
              top: CommonVariables(context: context).getAppBarPaddingTop()
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ResponsiveContainer(
                  width: 100.0,
                  child: ResponsivePadding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Application.router.navigateTo(context, RouteConstants.ROUTE_HOME, clearStack: true);
                          },
                          child: new ResponsivePadding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: new ResponsiveImage(
                              image: new ExactAssetImage("images/icons/ic_back.png"),
                              width: 24.0,
                              height: 17.0
                            )
                          )
                        )
                      ]
                    )
                  )
                ),
                Text(
                  "Category",
                  style: CommonStyles(context: context).getHeaderText()
                ),
                ResponsiveContainer(
                  width: 100.0,
                  child: ResponsivePadding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        InkWell(
                          onTap: () {},
                          child: new ResponsivePadding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: new ResponsiveImage(
                              image: new ExactAssetImage("images/icons/ic_plus.png"),
                              width: 24.0,
                              height: 24.0
                            )
                          )
                        )
                      ]
                    )
                  )
                )
              ]
            )
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: ResponsivePadding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 14.0, bottom: 18.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    decoration: new BoxDecoration(
                      color: CommonColors.lightGray,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(5.0))
                    ),
                    child: TextField(
                      style: CommonStyles(context: context).getBlackNormalText(),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search Category',
                        hintStyle: CommonStyles(context: context).getGrayNormalText(),
                        icon: Icon(Icons.search)
                      )
                    )
                  )
                )
              )
            ]
          )
        ]
      )
    );
  }
}