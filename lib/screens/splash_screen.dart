import 'dart:async';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finey/screens/walk_through_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/application.dart';
import '../config/routes.dart';
import './common_widgets/responsive_image.dart';
import './common_widgets/responsive_padding.dart';
import '../styles/common_styles.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Timer _timer;

  void checkFirstSeen() async {

    final prefs = await SharedPreferences.getInstance();
    int launchCount = prefs.getInt('counter') ?? 0;
    prefs.setInt('counter', launchCount + 1);

    if (launchCount == 0) {
      print("Primeira Vez");
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new WalkThroughScreen()));
    } else {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new LoginScreen()));
    }
  }

  _SplashScreenState() {
    _timer = new Timer(const Duration(milliseconds: 3000), () {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new LoginScreen()));
      checkFirstSeen();
      Application.router.navigateTo(
          context,
          RouteConstants.ROUTE_WALK_THROUGH,
          clearStack: true,
          replace: true,
          transition: TransitionType.fadeIn
      );
    });
  }

  @override
  void dispose() {
   super.dispose();
   _timer.cancel();
  }

  Widget _buildWithConstraints(BuildContext context, BoxConstraints constraints) {
    var column = new Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  ResponsiveImage(
                    image: new ExactAssetImage('images/icons/logo2.png'),
                    width: 120.0,
                    height: 120.0
                  ),
                  ResponsivePadding(
                    padding: EdgeInsets.all(30.0),
                    child: Text("CM INVESTIMENTOS",
                    style: TextStyle(color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 32)
                      ),
                        //style: CommonStyles(context: context).getSplashLogoText())
                  )
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ResponsivePadding(
                padding: EdgeInsets.all(52.0),
                child: Text("Todos direitos - CM Investimentos v01"),
              )
            ],
          ),
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
        body: layoutBuilder
    );

    return scaffold;
  }
}