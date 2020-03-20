import 'package:flutter/material.dart';

import '../sample_data/categories.dart';
import '../config/routes.dart';
import './common_widgets/finey_drawer.dart';
import './category_widgets/category_item.dart';
import './category_widgets/category_header.dart';

class CategoryScreen extends StatefulWidget {
  CategoryScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CategoryScreenState createState() => new _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  Widget _buildWithConstraints(BuildContext context, BoxConstraints constraints) {
    var column = new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          CategoryHeader(),
          Expanded(
            child: GridView.count(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              crossAxisCount: 3,
              children: List.generate(categories.length, (index) {
                return CategoryItem(category: categories[index]);
              })
            )
          )
        ]
    );

    var constrainedBox = new ConstrainedBox(
      constraints: constraints.copyWith(
        maxHeight: MediaQuery.of(context).size.height
      ),
      child: new Container(
        color: Colors.white,
        child: column,
      ),
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
        body: layoutBuilder,
        drawer: FineyDrawer(
            rootContext: context,
            currentPath: RouteConstants.ROUTE_CATEGORY
        )
    );

    return scaffold;
  }
}