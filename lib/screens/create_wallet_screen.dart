import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import '../config/application.dart';
import '../config/routes.dart';
import '../model/currency.dart';

import './common_widgets/rectangle_button.dart';
import './common_widgets/finey_header.dart';
import './common_widgets/responsive_padding.dart';
import './common_widgets/link_card_button.dart';
import './common_widgets/responsive_image.dart';
import './create_wallet_widgets/create_wallet_form.dart';
import './create_wallet_widgets/currency_dialog.dart';
import './create_wallet_widgets/name_dialog.dart';
import './create_wallet_widgets/money_dialog.dart';
import '../styles/common_variables.dart';

class CreateWalletScreen extends StatefulWidget {
  CreateWalletScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CreateWalletScreenState createState() => new _CreateWalletScreenState();
}

class _CreateWalletScreenState extends State<CreateWalletScreen> {

  Future _openCurrencyDialog() async {
    Currency saveCurrency = await Navigator.of(context).push(new MaterialPageRoute<Currency>(
      builder: (BuildContext context) {
        return CurrencyDialog();
      },
      fullscreenDialog: true
    ));
    if (saveCurrency != null) {
      // _addWeightSave(save);
    }
  }

  Future _openNameDialog() async {
    Currency saveCurrency = await Navigator.of(context).push(new MaterialPageRoute<Currency>(
      builder: (BuildContext context) {
        return NameDialog();
      },
      fullscreenDialog: true
    ));
    if (saveCurrency != null) {
      // _addWeightSave(save);
    }
  }

  Future _openMoneyDialog() async {
    Currency saveCurrency = await Navigator.of(context).push(new MaterialPageRoute<Currency>(
        builder: (BuildContext context) {
          return MoneyDialog();
        },
        fullscreenDialog: true
    ));
    if (saveCurrency != null) {
      // _addWeightSave(save);
    }
  }

  Widget _buildWithConstraints(BuildContext context, BoxConstraints constraints) {
    double deviceHeight = MediaQuery.of(context).size.height;

    var column = new Column(
      children: <Widget>[
        FineyHeader(
          title: 'Create Wallet'
        ),
        Container(
          height: deviceHeight - CommonVariables(context: context).getAppBarHeight() - CommonVariables(context: context).getScreenPaddingBottom(),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ResponsivePadding(
                    padding: const EdgeInsets.symmetric(vertical: 56.0),
                    child: ResponsiveImage(
                      image: ExactAssetImage("images/icons/ic_wallet_active.png"),
                      width: 64.0,
                      height: 64.0,
                    )
                  ),
                  CreateWalletForm(
                    onPressCurrency: _openCurrencyDialog,
                    onPressName: _openNameDialog,
                    onPressMoney: _openMoneyDialog
                  ),
                  ResponsivePadding(
                    padding: const EdgeInsets.only(top: 32.0, bottom: 16.0),
                    child: LinkCardButtonWidget(
                      text: "LINK OR CARD",
                      onPress: () {
                        Application.router.navigateTo(
                          context,
                          RouteConstants.ROUTE_ADD_BANK
                        );
                      }
                    )
                  )
                ]
              ),
              ResponsivePadding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: RectangleButtonWidget(
                  isFullWidth: true,
                  text: "CONTINUE",
                  btnWidth: CommonVariables.defaultBtnWidth,
                  btnHeight: CommonVariables.defaultBtnHeight,
                  onPressed: () {
                    Application.router.navigateTo(
                      context,
                      RouteConstants.ROUTE_HOME,
                      clearStack: true,
                      replace: true,
                      transition: TransitionType.fadeIn
                    );
                  }
                )
              )
            ]
          )
        )
      ],
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
    );

    return scaffold;
  }
}