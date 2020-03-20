import 'package:flutter/material.dart';

import '../config/routes.dart';
import '../config/application.dart';

import '../model/wallet.dart';
import '../sample_data/wallets.dart';
import './common_widgets/finey_drawer.dart';
import './common_widgets/responsive_padding.dart';
import './common_widgets/link_card_button.dart';
import './list_wallet_widgets/list_wallet_header.dart';
import './list_wallet_widgets/wallet_item_card.dart';
import '../styles/common_variables.dart';
import '../styles/common_styles.dart';

class ListWalletScreen extends StatefulWidget {
  ListWalletScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListWalletScreenState createState() => new _ListWalletScreenState();
}

class _ListWalletScreenState extends State<ListWalletScreen> {
  Widget _renderItem(BuildContext context, int index) {
    Wallet wallet = wallets[index];
    return WalletItemCard(
      type: wallet.title,
      information: wallet.subtitle,
      money: wallet.money.toString(),
      icon: wallet.icon,
      moneyTextStyle: CommonStyles(context: context).getBlueNormalText()
    );
  }

  Widget _buildWithConstraints(BuildContext context, BoxConstraints constraints) {
    var column = new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        ListWalletHeader(),
        Expanded(
          child: Container(
            color: Colors.white,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              itemBuilder: _renderItem,
              itemCount: wallets.length
            )
          )
        ),
        ResponsivePadding(
          padding: const EdgeInsets.only(bottom: 40.0),
          child: LinkCardButtonWidget(
            text: "ADD WALLET",
          onPress: () {
            Application.router.navigateTo(
              context,
              RouteConstants.ROUTE_ADD_WALLET
            );
          })
        )
      ]
    );

    var constrainedBox = new ConstrainedBox(
      constraints: constraints.copyWith(
        maxHeight: MediaQuery.of(context).size.height,
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
        currentPath: RouteConstants.ROUTE_LIST_WALLET
      )
    );

    return scaffold;
  }
}