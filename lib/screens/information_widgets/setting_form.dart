import 'package:flutter/material.dart';

import '../common_widgets/responsive_padding.dart';
import '../../styles/common_styles.dart';

class SettingForm extends StatelessWidget {
  SettingForm();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width / 2,
                child: ResponsivePadding(
                  padding: const EdgeInsets.only(left: 40.0, right: 20.0, bottom: 24.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'FIRST NAME',
                      labelStyle: CommonStyles(context: context).getLabelText()
                    )
                  )
                )
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                child: ResponsivePadding(
                  padding: const EdgeInsets.only(left: 20.0, right: 40.0, bottom: 24.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'LAST NAME',
                      labelStyle: CommonStyles(context: context).getLabelText()
                    )
                  )
                )
              )
            ]
          ),
          ResponsivePadding(
            padding: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 24.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'EMAIL',
                labelStyle: CommonStyles(context: context).getLabelText()
              )
            )
          ),
          ResponsivePadding(
            padding: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 24.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'PHONE NUMBER',
                labelStyle: CommonStyles(context: context).getLabelText()
              )
            )
          ),
          ResponsivePadding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'GENDER',
                labelStyle: CommonStyles(context: context).getLabelText()
              )
            )
          )
        ]
      )
    );
  }
}