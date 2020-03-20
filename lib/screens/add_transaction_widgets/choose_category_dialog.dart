import 'package:flutter/material.dart';

import '../common_widgets/responsive_container.dart';
import '../common_widgets/responsive_padding.dart';
import '../common_widgets/responsive_image.dart';
import '../../sample_data/categories.dart';
import '../../styles/common_variables.dart';
import '../../styles/common_styles.dart';
import '../../styles/common_colors.dart';
import './category_item.dart';

class ChooseCategoryDialog extends StatefulWidget {
  @override
  _ChooseCategoryDialogState createState() => new _ChooseCategoryDialogState();
}

class _ChooseCategoryDialogState extends State<ChooseCategoryDialog> {

  Widget _listCategory() {
    return GridView.count(
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
      crossAxisCount: 3,
      children: List.generate(12, (index) {
        return CategoryItem(
          category: categories[index % 3]
        );
      })
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
                  "Category",
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
                              image: new ExactAssetImage("images/icons/ic_plus.png"),
                              width: 24.0,
                              height: 24.0
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
                        hintText: 'Search Category',
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
          child: _listCategory()
        )
      ]
    );

    var constrainedBox = new ConstrainedBox(
      constraints: constraints.copyWith(
        maxHeight: MediaQuery.of(context).size.height
      ),
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
