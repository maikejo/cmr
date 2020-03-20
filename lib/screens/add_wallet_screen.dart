import 'package:flutter/material.dart';

import '../config/application.dart';
import '../config/routes.dart';
import '../model/currency.dart';

import './common_widgets/rectangle_button.dart';
import './common_widgets/finey_header.dart';
import './common_widgets/responsive_padding.dart';
import './common_widgets/link_card_button.dart';
import './create_wallet_widgets/create_wallet_form.dart';
import './create_wallet_widgets/currency_dialog.dart';
import './create_wallet_widgets/name_dialog.dart';
import './create_wallet_widgets/money_dialog.dart';
import '../styles/common_variables.dart';

class AddWalletScreen extends StatefulWidget {
  AddWalletScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AddWalletScreenState createState() => new _AddWalletScreenState();
}

class _AddWalletScreenState extends State<AddWalletScreen> {

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
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        FineyHeader(
          title: "Add Wallet",
          leftImageIconButton: "images/icons/ic_close.png",
          leftImageIconButtonWidth: 20.0,
          leftImageIconButtonHeight: 20.0,
          onPressLeftButton: () {
            Navigator.of(context).pop();
          }
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
                    padding: const EdgeInsets.only(top: 32.0),
                    child: CreateWalletForm(
                      onPressCurrency: _openCurrencyDialog,
                      onPressName: _openNameDialog,
                      onPressMoney: _openMoneyDialog
                    )
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
                  text: "CREATE",
                  btnWidth: CommonVariables.defaultBtnWidth,
                  btnHeight: CommonVariables.defaultBtnHeight,
                  onPressed: () {
                    Navigator.of(context).pop();
                  }
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
      ),
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