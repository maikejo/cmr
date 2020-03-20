import 'package:flutter/material.dart';

import '../common_widgets/responsive_padding.dart';
import '../common_widgets/responsive_container.dart';
import '../common_widgets/responsive_image.dart';
import '../common_widgets/circle_image.dart';
import '../../styles/common_styles.dart';
import '../../styles/common_colors.dart';
import '../../styles/common_variables.dart';
import '../../model/location.dart';

class ChooseLocationDialog extends StatefulWidget {
  @override
  _ChooseLocationDialogState createState() => new _ChooseLocationDialogState();
}

class _ChooseLocationDialogState extends State<ChooseLocationDialog> {
  final List<Location> locations = [
    Location(
      title: "Rosalie Phillips",
      address: "744 Lang Island Suite 736",
      icon: "https://user-images.githubusercontent.com/15681137/47368215-30a55d80-d71c-11e8-8ee6-7e5b11e7b84c.png"
    ),
    Location(
      title: "Rosalie Phillips",
      address: "744 Lang Island Suite 736",
      icon: "https://user-images.githubusercontent.com/15681137/47368215-30a55d80-d71c-11e8-8ee6-7e5b11e7b84c.png"
    ),
    Location(
      title: "Rosalie Phillips",
      address: "744 Lang Island Suite 736",
      icon: "https://user-images.githubusercontent.com/15681137/47368215-30a55d80-d71c-11e8-8ee6-7e5b11e7b84c.png"
    ),
    Location(
      title: "Rosalie Phillips",
      address: "744 Lang Island Suite 736",
      icon: "https://user-images.githubusercontent.com/15681137/47368215-30a55d80-d71c-11e8-8ee6-7e5b11e7b84c.png"
    ),
    Location(
      title: "Rosalie Phillips",
      address: "744 Lang Island Suite 736",
      icon: "https://user-images.githubusercontent.com/15681137/47368215-30a55d80-d71c-11e8-8ee6-7e5b11e7b84c.png"
    ),
    Location(
      title: "Rosalie Phillips",
      address: "744 Lang Island Suite 736",
      icon: "https://user-images.githubusercontent.com/15681137/47368215-30a55d80-d71c-11e8-8ee6-7e5b11e7b84c.png"
    ),
  ];

  Widget _locationItem(BuildContext context, int index) {
    Location location = locations[index];
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
                imageNetwork: new NetworkImage(location.icon),
                width: 40.0,
                height: 40.0
              ),
              Expanded(
                child: ResponsivePadding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ResponsivePadding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          location.title,
                          style: CommonStyles(context: context).getBlackNormalText()
                        )
                      ),
                      
                      Text(
                        location.address,
                        style: CommonStyles(context: context).getGraySmallText()
                      )
                    ]
                  )
                )
              )
            ]
          )
        )
      )
    ); 
  }

  Widget _listLocation() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 0.0),
      itemCount: locations.length,
      itemBuilder: _locationItem
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
                  "Choose Location",
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
                        hintText: 'Search Location',
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
          child: _listLocation()
        )
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
