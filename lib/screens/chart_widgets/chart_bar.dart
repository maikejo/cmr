import 'package:flutter/material.dart';
import '../../config/application.dart';
import '../../config/routes.dart';

import '../common_widgets/responsive_image.dart';
import '../common_widgets/responsive_padding.dart';
import '../common_widgets/responsive_container.dart';
import '../../styles/common_colors.dart';

class ChartBar extends StatelessWidget {
  ChartBar({this.leftButton, this.rightButton});

  final Widget leftButton;
  final Widget rightButton;

  Widget _buildLeftButton(context) {
    return new InkWell(
      child: ResponsiveImage(
        image: new ExactAssetImage("images/icons/ic_wallet.png"),
        width: 24.0,
        height: 24.0
      ),
      onTap: () {
        Scaffold.of(context).openDrawer();
      }
    );
  }

  Widget _buildRightButton(context) {
    return new InkWell(
      child: ResponsiveImage(
        image: new ExactAssetImage("images/icons/ic_chart.png"),
        width: 28.0,
        height: 23.1
      ),
      onTap: () {
        Scaffold.of(context).openDrawer();
      }
    );
  }

  Widget _buildCenterButton(context) {
    return ResponsiveContainer(
      width: 56.0,
      height: 56.0,
      decoration: const BoxDecoration(
        boxShadow: [
          const BoxShadow(
            color: Colors.black26,
            blurRadius: 15.0,
            offset: Offset(0.0, 10.0)
          )
        ],
        borderRadius: const BorderRadius.all(const Radius.circular(100.0))
      ),
      child: new FloatingActionButton(
        backgroundColor: CommonColors.blue,
        child: Center(
          child: Icon(
            Icons.add,
            color: CommonColors.white
          )
        ),
        onPressed: () {
          Application.router.navigateTo(context, RouteConstants.ROUTE_ADD_TRANSACTION);
        }
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return ResponsivePadding(
      padding: EdgeInsets.only(bottom: 9.0, right: 68.0, left: 68.0, top: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildLeftButton(context),
          _buildCenterButton(context),
          _buildRightButton(context),
        ],
      )
    );
  }
}