import 'package:flutter/material.dart';
import 'package:flutter_finey/client/getAccountInfo.dart';
import 'package:flutter_finey/model/carteira.dart';

import '../common_widgets/responsive_padding.dart';
import '../common_widgets/responsive_container.dart';
import '../common_widgets/responsive_image.dart';
import '../../styles/common_styles.dart';
import '../../styles/common_variables.dart';

class HomeHeader extends StatelessWidget {
  HomeHeader({this.accountInfo,this.post});

  final String accountInfo;
  final Future<Carteira> post;

  Widget _buildHeaderLeft(context) {
    return ResponsiveContainer(
      width: 100.0,
      child: ResponsivePadding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            InkWell(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: new ResponsivePadding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: new ResponsiveImage(
                  image: new ExactAssetImage("images/icons/ic_menu.png"),
                  width: 18.0,
                  height: 14.5 
                )
              )
            )
          ]
        )
      )
    );
  }

  // Build right header
  Widget _buildHeaderRight(context) {
    return ResponsiveContainer(
      width: 100.0,
      child: ResponsivePadding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            /*InkWell(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: new ResponsivePadding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: new ResponsiveImage(
                  image: new ExactAssetImage("images/icons/ic_filter.png"),
                  width: 18.0,
                  height: 14.5 
                )
              )
            ),*/
            /*InkWell(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: new ResponsivePadding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: new ResponsiveImage(
                  image: new ExactAssetImage("images/icons/avatar.png"),
                  width: 28.0,
                  height: 28.0 
                )
              )
            )*/
          ]
        )
      )
    );
  }

  // Build center header
  Widget _buildHeaderCenter(context) {

    return Column(
      children: <Widget>[

        new Container(
          margin: const EdgeInsets.only(top: 10.0),
             child: new FutureBuilder<Carteira>(
              future: post,
              builder: (BuildContext context, AsyncSnapshot<Carteira> snapshot) {

                if (snapshot.hasData) {
                  return new Text(
                     'Minha Carteira: ' + snapshot.data.brl,
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)
                  );
                }
                return SizedBox(
                    child:
                    new CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation(Colors.blueAccent),
                        strokeWidth: 2.0),
                    height: 20.0,
                    width: 20.0);
              },
            ),
        )
      ]
    );
  }

  // Build time filter bar
  Widget _buildTimeFilterBar(context) {
    return ResponsivePadding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new InkWell(
            onTap: () => {},
            child: Text(
              "MÊS PASSADO",
              style: CommonStyles(context: context).getGraySmallText()
            )
          ),
          new InkWell(
            onTap: () => {},
            child: Text(
              "MÊS ATUAL",
              style: CommonStyles(context: context).getGraySmallText()
            )
          ),
          new InkWell(
            onTap: () => {},
            child: Text(
              "PROXIMO MÊS",
              style: CommonStyles(context: context).getGraySmallText()
            )
          )
        ]
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    double appBarPaddingTop = CommonVariables(context: context).getAppBarPaddingTop(); 
    double appBarHeight = CommonVariables(context: context).getAppBarHeight(); 
    double headerRowHeight = appBarHeight - appBarPaddingTop;

    return Container(
      padding: EdgeInsets.only(top: appBarPaddingTop),
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
          new Container(
            height: headerRowHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _buildHeaderLeft(context),
                _buildHeaderCenter(context),
                _buildHeaderRight(context)
              ]
            )
          ),
          _buildTimeFilterBar(context)
        ]
      )
    );
  }
}