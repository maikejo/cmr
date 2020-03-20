import 'package:flutter/material.dart';

import './common_widgets/responsive_padding.dart';
import './common_widgets/category_item.dart';
import './profile_premium_widgets/profile_premium_header.dart';
import './home_widgets/home_detail_button.dart';
import './profile_less_widgets/filter_bar.dart';
import '../styles/common_variables.dart';
import '../styles/common_styles.dart';
import '../styles/common_colors.dart';

class ProfilePremiumScreen extends StatefulWidget {
  ProfilePremiumScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ProfilePremiumScreenState createState() => new _ProfilePremiumScreenState();
}

class _ProfilePremiumScreenState extends State<ProfilePremiumScreen> {
  // Build category card
  Widget _buildCategoryCards(BuildContext context) {
    List<Widget> list = new List<Widget>();

    for(var i = 0; i < 10; i++){
      list.add(
        CategoryItem(
          categoryName: "Salary",
          categoryIcon: new ExactAssetImage("images/icons/ic_Grab.png"),
          money: "15.00",
          moneyTextStyle: CommonStyles(context: context).getBlueNormalText()
        )
      );
    }
    return new Column(
      children: list
    );
  }

  Widget _buildSummaryBox(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ResponsivePadding(
          padding: const EdgeInsets.only(right: 16.0),
          child: HomeDetailButton(
            bgColor: CommonColors.blue,
            label: "Income",
            value: "13,500.00"
          )
        ),
        HomeDetailButton(
          bgColor: CommonColors.red,
          label: "Expense",
          value: "13,500.00"
        )
      ] 
    );
  }

  Widget _buildTopCategoryTitle(context) {
    return ResponsivePadding(
      padding: const EdgeInsets.only(top: 32.0, bottom: 16.0, right: 16.0, left: 16.0),
      child: Text(
        "TOP CATEGORIES",
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
        ProfilePremiumHeader(),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.only(top: 32.0),
            children: <Widget>[
              FilterBar(),
              _buildSummaryBox(context),
              _buildTopCategoryTitle(context),
              ResponsivePadding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                  child: _buildCategoryCards(context)
                )
              )
            ]
          )
        )
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
      body: layoutBuilder
    );

    return scaffold;
  }
}