import 'dart:async';
import 'package:flutter/material.dart';

import '../model/category.dart';

import './common_widgets/finey_header.dart';
import './common_widgets/responsive_padding.dart';
import './common_widgets/link_card_button.dart';
import 'add_transaction_widgets/money_box.dart';
import 'add_transaction_widgets/choose_date_dialog.dart';
import 'add_transaction_widgets/choose_category_dialog.dart';
import 'add_transaction_widgets/choose_wallet_dialog.dart';
import 'add_transaction_widgets/choose_friend_dialog.dart';
import 'add_transaction_widgets/choose_location_dialog.dart';
import 'add_transaction_widgets/choose_category_form.dart';
import 'add_transaction_widgets/choose_wallet_form.dart';
import '../styles/common_variables.dart';

class AddTransactionScreen extends StatefulWidget {
  AddTransactionScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AddTransactionScreenState createState() => new _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {

  Future _openCategoryDialog() async {
    Category saveCurrency = await Navigator.of(context).push(new MaterialPageRoute<Category>(
      builder: (BuildContext context) {
        return ChooseCategoryDialog();
      },
      fullscreenDialog: true
    ));
    if (saveCurrency != null) {
      // TODO: _addWeightSave(save);
    }
  }

  Future _openWalletDialog() async {
    Category saveCurrency = await Navigator.of(context).push(new MaterialPageRoute<Category>(
      builder: (BuildContext context) {
        return ChooseWalletDialog();
      },
      fullscreenDialog: true
    ));
    if (saveCurrency != null) {
      // TODO: _addWeightSave(save);
    }
  }

  Future _openFriendDialog() async {
    Category saveCurrency = await Navigator.of(context).push(new MaterialPageRoute<Category>(
      builder: (BuildContext context) {
        return ChooseFriendDialog();
      },
      fullscreenDialog: true
    ));
    if (saveCurrency != null) {
      // TODO: _addWeightSave(save);
    }
  }

  Future _openLocationDialog() async {
    Category saveCurrency = await Navigator.of(context).push(new MaterialPageRoute<Category>(
      builder: (BuildContext context) {
        return ChooseLocationDialog();
      },
      fullscreenDialog: true
    ));
    if (saveCurrency != null) {
      // TODO: _addWeightSave(save);
    }
  }

  Future _openDateDialog() async {
    Category saveCurrency = await Navigator.of(context).push(new MaterialPageRoute<Category>(
        builder: (BuildContext context) {
          return ChooseDateDialog();
        },
        fullscreenDialog: true
    ));
    if (saveCurrency != null) {
      // TODO: _addWeightSave(save);
    }
  }

  Widget _buildWithConstraints(BuildContext context, BoxConstraints constraints) {
    var column = new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        FineyHeader(
          title: "Add Transaction",
          leftImageIconButton: "images/icons/ic_close.png",
          leftImageIconButtonWidth: 20.0,
          leftImageIconButtonHeight: 20.0,
          rightImageIconButton: "images/icons/ic_done.png",
          rightImageIconButtonWidth: 20.0,
          rightImageIconButtonHeight: 20.0,
          onPressLeftButton: () {
            Navigator.of(context).pop();
          }
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.only(top: 24.0),
            children: <Widget>[
              MoneyBox(
                onPressExpense: _openCategoryDialog,
              ),
              ChooseCategoryForm(
                onPressCategory: _openCategoryDialog,
                onPressDate: _openDateDialog,
              ),
              ChooseWalletForm(
                onPressWallet: _openWalletDialog,
                onPressFriend: _openFriendDialog,
                onPressLocation: _openLocationDialog
              ),
              ResponsivePadding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Column(
                  children: <Widget>[
                    LinkCardButtonWidget(
                      text: "ADD IMAGE"
                    )
                  ]
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