import 'package:flutter/material.dart';

import '../../config/routes.dart';
import '../../config/application.dart';

import '../../model/wallet.dart';
import '../../sample_data/wallets.dart';
import '../common_widgets/responsive_container.dart';
import '../common_widgets/responsive_padding.dart';
import '../common_widgets/responsive_image.dart';
import '../common_widgets/link_card_button.dart';
import '../list_wallet_widgets/wallet_item_card.dart';
import '../../styles/common_styles.dart';
import '../../styles/common_variables.dart';
import '../../styles/common_colors.dart';

class ChooseWalletDialog extends StatefulWidget {
  @override
  _ChooseWalletDialogState createState() => new _ChooseWalletDialogState();
}

class _ChooseWalletDialogState extends State<ChooseWalletDialog> {
  Widget _walletItem(BuildContext context, int index) {
    Wallet wallet = wallets[index];
    return WalletItemCard(
      type: wallet.title,
      information: wallet.subtitle,
      money: wallet.money.toString(),
      icon: wallet.icon,
      moneyTextStyle: CommonStyles(context: context).getBlueNormalText()
    );
  }

  Widget _listWallet() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      itemCount: wallets.length,
      itemBuilder: _walletItem,
    );
  }

  Widget _dialogHeader() {
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
                            Navigator.of(context).pop();
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
                  "Choose Wallet",
                  style: CommonStyles(context: context).getHeaderText()
                ),
                ResponsiveContainer(
                  width: 100.0,
                  child: ResponsivePadding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                        hintText: 'Search Wallet',
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

  Widget _buildWithConstraints(BuildContext context, BoxConstraints constraints) {
    var column = new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        _dialogHeader(),
        Expanded(
          child: _listWallet()
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
            }
          )
        )
      ]
    );

    var constrainedBox = new ConstrainedBox(
      constraints:
      constraints.copyWith(maxHeight: MediaQuery.of(context).size.height),
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
    var layoutBuilder = new LayoutBuilder(builder: _buildWithConstraints);

    var scaffold = new Scaffold(body: layoutBuilder);

    return scaffold;
  }
}
