import 'package:flutter/material.dart';
import 'package:flutter_finey/styles/common_variables.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../common_widgets/responsive_image.dart';
import '../common_widgets/responsive_padding.dart';
import '../common_widgets/responsive_container.dart';
import '../../styles/common_colors.dart';

class HomeBar extends StatelessWidget {
  HomeBar({
    @required this.handleClickChartButton,
    @required this.handleClickWalletButton,
    @required this.handleClickMainButton,
    this.handleClickListaRetiradaButton,
    this.handleClickListaDepositoButton
  });

  final Function handleClickChartButton;
  final Function handleClickWalletButton;
  final Function handleClickMainButton;
  final Function handleClickListaRetiradaButton;
  final Function handleClickListaDepositoButton;

  Widget _getFAB() {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 22),
      backgroundColor: Color(0xFF801E48),
      visible: true,
      curve: Curves.bounceIn,
      children: [
        // FAB 1
        SpeedDialChild(
            child: Icon(Icons.assignment_turned_in),
            backgroundColor: Color(0xFF801E48),
            onTap: () { /* do anything */ },
            label: 'Button 1',
            labelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 16.0),
            labelBackgroundColor: Color(0xFF801E48)),
        // FAB 2
        SpeedDialChild(
            child: Icon(Icons.assignment_turned_in),
            backgroundColor: Color(0xFF801E48),
            onTap: () {

            },
            label: 'Button 2',
            labelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 16.0),
            labelBackgroundColor: Color(0xFF801E48))
      ],
    );
  }

  Widget _buildCarteiraButton(context) {
    return new InkWell(
      child: Container(
        margin: const EdgeInsets.only(left: 30),
        child: ResponsiveImage(
            image: new ExactAssetImage("images/icons/ic_carteira.png"),
            width: 40.0,
            height: 40.0
        ),
      ),
      onTap: this.handleClickMainButton
    );
  }

  Widget _buildGraficotButton(context) {
    return new InkWell(
        child: Container(
          margin: const EdgeInsets.only(right: 40),
          child: ResponsiveImage(
              image: new ExactAssetImage("images/icons/ic_rendimentos.png"),
              width: 40.0,
              height: 40.0
          ),
        ),
        onTap: this.handleClickChartButton
    );
  }

  Widget _buildRetiradaButton(context) {
    return new InkWell(
        child: Container(
          margin: const EdgeInsets.only(left: 30),
          child: ResponsiveImage(
              image: new ExactAssetImage("images/icons/ic_banco.png"),
              width: 40.0,
              height: 40.0
          ),
        ),
        onTap: this.handleClickListaRetiradaButton
    );
  }

  Widget _buildDepositoButton(context) {
    return new InkWell(
        child: Container(
          margin: const EdgeInsets.only(right: 30),
          child: ResponsiveImage(
              image: new ExactAssetImage("images/icons/ic_transacao.png"),
              width: 45.0,
              height: 45.0
          ),
        ),
        onTap: this.handleClickListaDepositoButton
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      width: 450.0,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          
            backgroundColor: Color(0xFF162A49) ,
          elevation: 10.0,
          child: const Icon(Icons.autorenew), onPressed: this.handleClickWalletButton),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 6.0,
          child: new Container(
            height: 200,
            //margin: const EdgeInsets.only(top: 5.0,left: 50),
            child: new Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buildCarteiraButton(context),
                _buildGraficotButton(context),
                _buildRetiradaButton(context),
                _buildDepositoButton(context),
              ],
            ),
          )
        ),
      ),
    );
  }
}