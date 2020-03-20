import 'dart:math';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_finey/service/auth.dart';

import '../config/routes.dart';

import './common_widgets/finey_drawer.dart';
import './common_widgets/responsive_padding.dart';
import './chart_widgets/chart_header.dart';
import './chart_widgets/chart_bar.dart';
import './chart_widgets/chart_detail_button.dart';
import './chart_widgets/detail_card.dart';
import './chart_widgets/chart_box.dart';
import '../styles/common_colors.dart';
import '../styles/common_styles.dart';
import '../styles/common_variables.dart';
import 'home_screen.dart';

class ChartScreen extends StatefulWidget {
  ChartScreen({Key key}) : super(key: key);

  @override
  _ChartScreenState createState() => new _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {

  static List<charts.Series<TimeSeriesSales, DateTime>> _createRandomData() {
    final random = new Random();

    final data = [
      new TimeSeriesSales(new DateTime(2017, 9, 19), random.nextInt(100)),
      new TimeSeriesSales(new DateTime(2017, 9, 26), random.nextInt(100)),
      new TimeSeriesSales(new DateTime(2017, 10, 3), random.nextInt(100)),
      new TimeSeriesSales(new DateTime(2017, 10, 10), random.nextInt(100)),
    ];

    return [
      new charts.Series<TimeSeriesSales, DateTime>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }

  Widget _buildSummaryBox(context) {
    return ResponsivePadding(
        padding: const EdgeInsets.only(top: 24.0, left: 16.0, right: 16.0),
        /*child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ResponsivePadding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: ChartDetailButton(
                      bgColor: CommonColors.blue,
                      label: "Entrada",
                      value: "R\$ 13.500.00"
                  )
              ),
              ChartDetailButton(
                  bgColor: CommonColors.red,
                  label: "Retirada",
                  value: "R\$ 5.500.00"
              )
            ]
        )*//*child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ResponsivePadding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: ChartDetailButton(
                      bgColor: CommonColors.blue,
                      label: "Entrada",
                      value: "R\$ 13.500.00"
                  )
              ),
              ChartDetailButton(
                  bgColor: CommonColors.red,
                  label: "Retirada",
                  value: "R\$ 5.500.00"
              )
            ]
        )*/
    );
  }

  Widget _buildCategoryTitle(context, String title) {
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

  Widget _buildCardItem(BuildContext context) {
    List<Widget> list = new List<Widget>();

    for(var i = 0; i < 2; i++){
      list.add(
          DetailCard(
              date: "07",
              day: "Hoje",
              categoryName: "Rentabilidade",
              categoryIcon: new ExactAssetImage("images/icons/ic_Grab.png"),
              category: "% 1,22",
              money: "R\$ 15.00",
              moneyTextStyle: CommonStyles(context: context).getBlueNormalText()
          )
      );
    }
    return ResponsivePadding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
        child: Column (
            children: list
        )
    );
  }

  Widget _buildWithConstraints(BuildContext context, BoxConstraints constraints) {
    var column = new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          ChartHeader(),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildSummaryBox(context),
                    Expanded(
                        child: ListView(
                            padding: const EdgeInsets.only(top: 24.0),
                            children: <Widget>[
                              ChartBox(_createRandomData()),
                              _buildCategoryTitle(context, "HOJE"),
                              _buildCardItem(context),
                              _buildCategoryTitle(context, "ONTEM"),
                              _buildCardItem(context)
                            ]
                        )
                    )
                  ]
              )
          ),
          ChartBar()
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
        body: layoutBuilder,
        drawer: FineyDrawer(
            rootContext: context,
            currentPath: RouteConstants.ROUTE_HOME,
            firebaseUser: Auth.user
        )
    );
    return scaffold;
  }
}