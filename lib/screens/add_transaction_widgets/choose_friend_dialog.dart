import 'package:flutter/material.dart';

import '../common_widgets/responsive_padding.dart';
import '../common_widgets/responsive_container.dart';
import '../common_widgets/responsive_image.dart';
import '../common_widgets/circle_image.dart';
import '../../styles/common_styles.dart';
import '../../styles/common_colors.dart';
import '../../styles/common_variables.dart';
import '../../model/friend.dart';
import '../../sample_data/friends.dart';

class ChooseFriendDialog extends StatefulWidget {
  @override
  _ChooseFriendDialogState createState() => new _ChooseFriendDialogState();
}

class _ChooseFriendDialogState extends State<ChooseFriendDialog> {

  Widget _friendItem(BuildContext context, int index) {
    Friend friend = friends[index];
    return FlatButton(
      onPressed: (){},
      child: Container(
        decoration: new BoxDecoration(
          border: new Border(
            bottom: new BorderSide(
              width: 1.0,
              color: CommonColors.lightGray
            )
          ) 
        ),
        child: ResponsivePadding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            children: <Widget>[
              CircleImage(
                image: ExactAssetImage(friend.avatar),
                width: 40.0,
                height: 40.0
              ),
              Expanded(
                child: ResponsivePadding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    friend.name,
                    style: CommonStyles(context: context).getBlackNormalText()
                  )
                )
              ),
            ]
          )
        )
      )
    ); 
  }

  Widget _listFriend() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 0.0),
      itemCount: friends.length,
      itemBuilder: _friendItem,
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
                  "Choose Friend",
                  style: CommonStyles(context: context).getHeaderText()
                ),
                ResponsiveContainer(
                  width: 100.0,
                  child: ResponsivePadding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        InkWell(
                          onTap: () {},
                          child: new ResponsivePadding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: new ResponsiveImage(
                              image: new ExactAssetImage("images/icons/ic_done.png"),
                              width: 24.0,
                              height: 16.0
                            )
                          )
                        )
                      ]
                    )
                  )
                )
              ]
            )
          ),
          ResponsivePadding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new InkWell(
                  onTap: () => {},
                  child: Text(
                    "CONTACT",
                    style: CommonStyles(context: context).getGraySmallText()
                  )
                ),
                new InkWell(
                  onTap: () => {},
                  child: Text(
                    "FACEBOOK",
                    style: CommonStyles(context: context).getGraySmallText()
                  )
                ),
                new InkWell(
                  onTap: () => {},
                  child: Text(
                    "TWITTER",
                    style: CommonStyles(context: context).getGraySmallText()
                  )
                )
              ]
            )
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
        Expanded(child: _listFriend())
      ]
    );

    var constrainedBox = new ConstrainedBox(
      constraints:
      constraints.copyWith(maxHeight: MediaQuery.of(context).size.height),
      child: new Container(
        color: Colors.white,
        child: column
      )
    );

    var scrollView = new SingleChildScrollView(child: constrainedBox);

    return scrollView;
  }

  @override
  Widget build(BuildContext context) {
    var layoutBuilder = new LayoutBuilder(builder: _buildWithConstraints);

    var scaffold = new Scaffold(body: layoutBuilder);

    return scaffold;
  }
}
