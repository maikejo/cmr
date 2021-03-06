import 'package:flutter/material.dart';
import '../../styles/common_styles.dart';

class LinkButtonWidget extends StatelessWidget {
  LinkButtonWidget({
    this.text,
    this.onTap
  });

  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onTap,
      child: new Text(
        text,
        style: CommonStyles(context: context).getLinkText()
      )
    );
  }
}