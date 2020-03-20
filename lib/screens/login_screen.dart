import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finey/model/user.dart';
import 'package:flutter_finey/screens/ativacao_screen.dart';
import 'package:flutter_finey/service/auth.dart';
import 'package:flutter_finey/util/custom_alert_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './common_widgets/responsive_image.dart';
import './common_widgets/responsive_padding.dart';
import './common_widgets/title.dart';
import './login_widgets/login_bottom.dart';
import './login_widgets/login_button.dart';
import './login_widgets/login_form.dart';
import '../config/application.dart';
import '../config/routes.dart';
import '../styles/common_variables.dart';
import 'documentos_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginScreenState createState() => new _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin{

  AnimationController _opacityController;
  bool checkValue = false;
  SharedPreferences sharedPreferences;

  @override
  void initState(){
    super.initState();

    _opacityController = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 3000),
    )
      ..addListener(() => setState(() {}))
      ..repeat(reverse: true);

    _opacityController.forward();

    getRemenberCredential();
  }

  @override
  void dispose() {
    _opacityController.dispose();
    super.dispose();
  }


  void _handleForgotPassword() {
    Application.router.navigateTo(context, RouteConstants.ROUTE_FORGOT_PASSWORD,transition: TransitionType.fadeIn);
  }

  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  _dismissDialog() {
    Navigator.pop(context);
  }

  void _showErrorAlert({String title, String content, VoidCallback onPressed}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return CustomAlertDialog(
            content: content, title: title, onPressed: _dismissDialog);
      },
    );
  }

  void _handleLogin() async {

    User user = await Auth.getDadosUser(_emailController.text);

    DocumentSnapshot documentacao = await Firestore.instance.collection('documentacao').document(_emailController.text).get();

    if(user.ativado){
      Application.router.navigateTo(context, RouteConstants.ROUTE_HOME,
          clearStack: true,
          replace: true,
          transition: TransitionType.fadeIn);
    }else if(documentacao.data['urlDocIdentificacao'] == "" || documentacao.data['urlDocResidencia'] == "" || documentacao.data['urlDocSelf'] == ""){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              DocumentosScreen(),
        ),
      );
    }else{
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              AtivacaoScreen(),
        ),
      );
    }

  }

  getRemenberCredential() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      checkValue = sharedPreferences.getBool("check");
      if (checkValue != null) {
        if (checkValue) {
          _emailController.text = sharedPreferences.getString("email");
          _senhaController.text = sharedPreferences.getString("senha");
        } else {
          _emailController.clear();
          _senhaController.clear();
          sharedPreferences.clear();
        }
      } else {
        checkValue = false;
      }
    });
  }

  void _emailLogin() async {

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return Center(child: CircularProgressIndicator(),);
          });

      try {
        await Auth.signIn(_emailController.text, _senhaController.text).then((uid) {
            _handleLogin();
          }
          );
      } catch (e) {
        _showErrorAlert(
            title: "Falha ao autenticar.", content: "Usuário ou Senha incorreto");
      }
  }

  void _handleSignUp() {
    Application.router.navigateTo(context, RouteConstants.ROUTE_SIGN_UP,transition: TransitionType.fadeIn);
  }

  _onChangedRemenber(bool value) async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      checkValue = value;
      sharedPreferences.setBool("check", checkValue);
      sharedPreferences.setString("email", _emailController.text);
      sharedPreferences.setString("senha", _senhaController.text);
      sharedPreferences.commit();
      getRemenberCredential();
    });
  }

  Widget _buildWithConstraints(
      BuildContext context, BoxConstraints constraints) {

    var column = new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/2.5,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF162A49),
                    Color(0xFF162A49),
                  ],
                ),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(120)
                )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Spacer(),
                Align(
                  alignment: Alignment.center,
                  child: ResponsiveImage(
                      image: new ExactAssetImage(
                          'images/icons/ic_logo.png'),
                      width: 140.0,
                      height: 140.0),
                ),
                TitleWidget(
                    text: 'CM INVESTIMENTOS',
                    paddingTop: 60.0,
                    paddingLeft: 80.0,
                    paddingRight: 10.0,
                    paddingBottom: 1.0),
                Spacer(),
              ],
            ),
          ),

          Container(
           padding: const EdgeInsets.only(top: 60.0),
           child: LoginForm(_emailController, _senhaController),
          ),


          Container(
            padding: new EdgeInsets.only(left: 230.0),
            child: CheckboxListTile(
              value: checkValue,
              onChanged: _onChangedRemenber,
              title: new Text("Lembrar"),
              controlAffinity: ListTileControlAffinity.leading,
            ),

          ),

          ResponsivePadding(
              padding: const EdgeInsets.only(
                  right: 40.0, left: 40.0, top: 32.0),
              child: LoginButton(
                handleForgotPassword: _handleForgotPassword,
                handleLogin: _emailLogin,
              )),

          ResponsivePadding(
              padding: const EdgeInsets.only(top: 50.0),
              child: LoginBottom(
                handleSignUp: _handleSignUp,
              ))

        ]);

    var constrainedBox = new ConstrainedBox(
        constraints:
            constraints.copyWith(maxHeight: MediaQuery.of(context).size.height),
        child: new Container(
            color: Colors.white,
            padding: EdgeInsets.only(
                bottom:
                    CommonVariables(context: context).getScreenPaddingBottom()),
            child: column));

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
