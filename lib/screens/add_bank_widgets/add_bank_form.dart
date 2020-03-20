import 'package:flutter/material.dart';

import '../common_widgets/responsive_padding.dart';
import '../../styles/common_styles.dart';

class AddBankForm extends StatelessWidget {
  AddBankForm();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          ResponsivePadding(
            padding: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 24.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Banco',
                labelStyle: CommonStyles(context: context).getLabelText()
              )
            )
          ),
          ResponsivePadding(
            padding: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 24.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Número da conta',
                labelStyle: CommonStyles(context: context).getLabelText()
              )
            )
          ),
          Row(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width / 2,
                child: ResponsivePadding(
                  padding: const EdgeInsets.only(left: 40.0, bottom: 24.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Agência',
                      labelStyle: CommonStyles(context: context).getLabelText()
                    )
                  )
                )
              ),
              Container(
                width: MediaQuery.of(context).size.width / 6,
                child: ResponsivePadding(
                  padding: const EdgeInsets.only(left: 16.0, bottom: 24.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Digito',
                      labelStyle: CommonStyles(context: context).getLabelText()
                    )
                  )
                )
              ),
            /*  Container(
                width: MediaQuery.of(context).size.width / 2,
                child: ResponsivePadding(
                  padding: const EdgeInsets.only(left: 24.0, right: 40.0, bottom: 24.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'CVV',
                      labelStyle: CommonStyles(context: context).getLabelText()
                    )
                  )
                )
              ),*/
            ]
          )
        ]
      )
    );
  }
}