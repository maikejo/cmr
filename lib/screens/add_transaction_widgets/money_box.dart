import 'package:flutter/material.dart';

import '../common_widgets/responsive_padding.dart';
import '../../styles/common_colors.dart';
import '../../styles/common_styles.dart';
import '../../styles/common_variables.dart';

class MoneyBox extends StatelessWidget {
  MoneyBox({this.onPressExpense, this.onPressIncome,this.valor});

  final Function onPressIncome;
  final Function onPressExpense;
  final String valor;

  Widget build(BuildContext context) {
    return ResponsivePadding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: CommonColors.blue,
          borderRadius: const BorderRadius.all(const Radius.circular(10.0))
        ),
        child: ResponsivePadding(
          padding: const EdgeInsets.only(top: 24.0, bottom: 36.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  InkWell(
                    child: Text(
                      "Informe o valor",
                      style: CommonStyles(context: context).getWhiteNormalText()
                    ),
                    onTap: this.onPressIncome
                  ),
                ]
              ),
              ResponsivePadding(
                padding: const EdgeInsets.only(top: 24.0,left: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "R\$",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontFamily: CommonVariables.defaultFont,
                        fontWeight: FontWeight.normal
                      )
                    ),
                    Container(
                      width: 210.0,
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "00,000.00",
                          fillColor: Colors.white,
                          hintStyle: TextStyle(color: Colors.white)
                        ),
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40.0,
                          fontFamily: CommonVariables.defaultFont,
                          fontWeight: FontWeight.normal
                        )
                      )
                    )
                  ]
                ),
              )
            ]
          )
        )
      )
    );
  }
}