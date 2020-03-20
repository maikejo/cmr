import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finey/config/application.dart';
import 'package:flutter_finey/config/routes.dart';
import 'package:flutter_finey/model/user.dart';
import 'package:flutter_finey/service/auth.dart';
import 'package:flutter_finey/util/custom_alert_dialog.dart';
import './common_widgets/responsive_padding.dart';
import './signup_widgets/sign_up_form.dart';
import './signup_widgets/sign_up_button.dart';
import './signup_widgets/sign_up_bottom.dart';
import '../styles/common_variables.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignupScreenState createState() => new _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _cpfController = TextEditingController();
  final _senhaController = TextEditingController();

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Sucesso"),
          content: new Text("Cadastro realizado com sucesso!"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Ok"),
              onPressed: () {
                Application.router.navigateTo(
                    context, RouteConstants.ROUTE_LOGIN,
                    clearStack: true,
                    replace: true,
                    transition: TransitionType.fadeIn
                );
              },
            ),
          ],
        );
      },
    );
  }

  void _showErrorAlert({String title, String content, VoidCallback onPressed}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return CustomAlertDialog(
          content: content,
          title: title,
          onPressed: onPressed,
        );
      },
    );
  }

  void _cadastrar() async {

    try {

      await Auth.signUp(_emailController.text, _senhaController.text).then((email) {
        Auth.addUser(new User(
            nome: _nomeController.text,
            cpf: _cpfController.text,
            email: _emailController.text,
            senha: _senhaController.text,
            imagemUrl: '',
            ativado: false
            )
        );
        _showDialog();
      });
    } catch (e) {
      print("Error in sign up: $e");
      String exception = Auth.getExceptionText(e);
      _showErrorAlert(
          title: "Já existe um cadastro com esse email.",
          content: exception
      );
    }

  }


  Widget _buildWithConstraints(BuildContext context, BoxConstraints constraints) {
    double deviceHeight = MediaQuery.of(context).size.height;

    var column = new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        new Container(
          height: deviceHeight - CommonVariables(context: context).getAppBarHeight() - CommonVariables(context: context).getScreenPaddingBottom(),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ResponsivePadding(
                    padding: const EdgeInsets.only(top: 85.0),
                    child: SignUpForm(_nomeController,_emailController,_cpfController,_senhaController,null)
                  ),
                  ResponsivePadding(
                    padding: const EdgeInsets.only(right: 40.0, left: 28.0, top: 32.0),
                    child: SignUpButton(_cadastrar)
                  ),
                ]
              ),
              ResponsivePadding(
                padding: const EdgeInsets.only(bottom: 90.0),
                child: SignUpBottom()
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
      builder: _buildWithConstraints
    );

    var scaffold = new Scaffold(
      body: layoutBuilder,
    );

    return scaffold;
  }
  
  }
  