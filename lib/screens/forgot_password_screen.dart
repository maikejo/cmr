import 'package:flutter/material.dart';

import '../config/application.dart';
import '../config/routes.dart';
import './common_widgets/title.dart';
import './common_widgets/finey_header.dart';
import './common_widgets/responsive_padding.dart';
import './forgot_password_widgets/forgot_password_bottom.dart';
import './forgot_password_widgets/active_account.dart';
import '../styles/common_variables.dart';
import '../styles/common_styles.dart';

class ForgotPasswordScreen extends StatefulWidget {
  ForgotPasswordScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ForgotPasswordScreenState createState() => new _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  Widget _buildWithConstraints(BuildContext context, BoxConstraints constraints) {
    double deviceHeight = MediaQuery.of(context).size.height;

    var column = new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        FineyHeader(
          leftImageIconButton: "images/icons/ic_back.png",
          leftImageIconButtonWidth: 24.0,
          leftImageIconButtonHeight: 17.0,
          onPressLeftButton: () {
            Navigator.of(context).pop();
          }
        ),
        new Container(
          height: deviceHeight - CommonVariables(context: context).getAppBarHeight() - CommonVariables(context: context).getScreenPaddingBottom(),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TitleWidget(
                    text: 'Esqueceu a Senha',
                    paddingTop: 96.0,
                    paddingLeft: 40.0,
                    paddingRight: 40.0,
                    paddingBottom: 0.0
                  ),
                  ResponsivePadding(
                    padding: const EdgeInsets.only(right: 40.0, left: 40.0, top: 16.0, bottom: 66.0),
                    child: Text(
                      "Não se preocupe, escolha o método que você deseja recuperar sua senha.",
                      style: CommonStyles(context: context).getGrayNormalText()
                    )
                  ),
                  ResponsivePadding(
                    padding: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 40.0),
                    child: ActiveAccount(
                      labelText: "Enviar E-Mail",
                      value: "******xyz@gmail.com",
                      icon: "images/icons/ic_mail.png",
                      iconWidth: 34.0,
                      iconHeight: 24.0,
                      onPressItem: (){
                        Application.router.navigateTo(context, RouteConstants.ROUTE_VERIFY_CODE);
                      }
                    )
                  ),
                  ResponsivePadding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: ActiveAccount(
                      labelText: "Enviar para numero",
                      value: "******123",
                      icon: "images/icons/ic_phone.png",
                      iconWidth: 20.0,
                      iconHeight: 32.0,
                      onPressItem: (){
                        Application.router.navigateTo(context, RouteConstants.ROUTE_VERIFY_CODE);
                      }
                    )
                  )
                ]
              ),
              ResponsivePadding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: ForgotPasswordBottom()
              )
            ]
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
    var layoutBuilder = new LayoutBuilder(
      builder: _buildWithConstraints,
    );

    var scaffold = new Scaffold(
      body: layoutBuilder,
    );

    return scaffold;
  }
}