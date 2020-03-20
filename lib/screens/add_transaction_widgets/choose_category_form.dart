import 'package:flutter/material.dart';

import '../common_widgets/responsive_padding.dart';
import '../common_widgets/selectable_item.dart';

class ChooseCategoryForm extends StatelessWidget {
  ChooseCategoryForm({this.onPressCategory, this.onPressDate, this.onPressMemo});

  final Function onPressCategory;
  final Function onPressDate;
  final Function onPressMemo;

  @override
  Widget build(BuildContext context) {
    return ResponsivePadding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 24.0, top: 24.0),
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
        child: Column(
          children: <Widget>[
            SelectableItem(
              imageIcon: "images/icons/ic_Grab.png",
              imageIconWidth: 31.0,
              imageIconHeight: 31.0,
              text: "Restaurant",
              onPressItem: this.onPressCategory,
            ),
            SelectableItem(
              imageIcon: "images/icons/ic_calendar.png",
              imageIconWidth: 22.0,
              imageIconHeight: 22.0,
              text: "Today, Jan 28, 2018",
              onPressItem: this.onPressDate,
            ),
            SelectableItem(
              imageIcon: "images/icons/ic_memo.png",
              imageIconWidth: 18.0,
              imageIconHeight: 14.5,
              text: "Memo",
              onPressItem: this.onPressMemo,
            )
          ]
        )
      )
    );
  }
}