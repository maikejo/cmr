import 'package:flutter/material.dart';

import '../common_widgets/finey_header.dart';
import '../common_widgets/responsive_padding.dart';
import '../../styles/common_styles.dart';

class NameDialog extends StatefulWidget {
  @override
  _NameDialogState createState() => new _NameDialogState();
}

class _NameDialogState extends State<NameDialog> {
  Widget _nameForm() {
    return Row(
      children: <Widget>[
        Expanded(
          child: ResponsivePadding(
            padding: const EdgeInsets.only(left: 40.0, right: 40.0, top: 56.0),
            child: TextField(
              style: CommonStyles(context: context).getBlackNormalText(),
              decoration: InputDecoration(
                hintText: "Input Name Wallet",
                hintStyle: CommonStyles(context: context).getGrayNormalText()
              )
            )
          )
        )
      ]
    );
  }

  Widget _dialogHeader(BuildContext context) {
    return FineyHeader(
      title: "Name Wallet",
      leftImageIconButton: "images/icons/ic_back.png",
      leftImageIconButtonWidth: 24.0,
      leftImageIconButtonHeight: 17.0,
      rightImageIconButton: "images/icons/ic_done.png",
      rightImageIconButtonWidth: 24.0,
      rightImageIconButtonHeight: 16.0,
      onPressLeftButton: () {
        Navigator.of(context).pop();
      }
    );
  }

  Widget _buildWithConstraints(BuildContext context, BoxConstraints constraints) {
    var column = new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        _dialogHeader(context),
        _nameForm()
      ]
    );

    var constrainedBox = new ConstrainedBox(
      constraints: constraints.copyWith(
        maxHeight: MediaQuery.of(context).size.height
      ),
      child: new Container(
        color: Colors.white,
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