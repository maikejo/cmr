import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './config/routes.dart';
import './config/application.dart';
import './styles/common_colors.dart';

class MainApp extends StatefulWidget {
  @override
  State createState() {
    return new MainAppState();
  }
}

class MainAppState extends State<MainApp> {
  MainAppState() {
    var router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    final app = new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CMR',
      theme: new ThemeData(
        //fontFamily: 'Quicksand',
        primarySwatch: Colors.blue,
        hintColor: CommonColors.gray,
        dividerColor: Colors.white,
      ),
      onGenerateRoute: Application.router.generator,
    );
    // print("initial route = ${app.initialRoute}");
    return app;
  }
}

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  runApp(new MainApp());
}

