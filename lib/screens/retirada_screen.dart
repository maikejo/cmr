import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_finey/helper/Email.dart';
import 'package:flutter_finey/service/auth.dart';
import 'package:flutter_finey/styles/common_colors.dart';
import 'package:toast/toast.dart';
import '../styles/common_styles.dart';
import '../styles/common_variables.dart';
import 'common_widgets/finey_header.dart';
import 'common_widgets/responsive_container.dart';
import 'common_widgets/responsive_padding.dart';
import 'home_widgets/home_detail_button.dart';

class RetiradaScreen extends StatefulWidget {
  RetiradaScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RetiradaScreenState createState() => new _RetiradaScreenState();
}

class _RetiradaScreenState extends State<RetiradaScreen> {

  TextEditingController valorRetirada = new TextEditingController();

  String _text = '';
  var email = Email('suportecmr01@gmail.com', 'cmr_1nv3st1men0s#');

  void _enviarEmailRetirada() async {
    bool result = await email.sendMessage(
        'Foi solicitado pelo cliente: ' + Auth.user.email +
            'a retirada no valor de: R\$ ' +valorRetirada.text,
        Auth.user.email,'suportecmr01@gmail.com', 'Solicitação de Retirada');

    setState(() {
      _text = result ? 'Enviado.' : 'Não enviado.';
    });
  }

  void _cadastrarRetirada() async{
    Firestore.instance.collection('retirada').document(Auth.user.email).collection("lista")
        .add({"data": DateTime.now(), "valor": valorRetirada.text});

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            RetiradaScreen(),
      ),
    );

    _enviarEmailRetirada();

    Toast.show("Solicitação enviada com sucesso!.Foi enviado um email da solicitação.", context, duration: 5, gravity:  Toast.BOTTOM);
  }

  Widget _buildWithConstraints(
      BuildContext context, BoxConstraints constraints) {
    var column = new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          FineyHeader(
              title: "Solicitação Retirada",
              leftImageIconButton: "images/icons/ic_close.png",
              leftImageIconButtonWidth: 20.0,
              leftImageIconButtonHeight: 20.0,
              onPressLeftButton: () {
                Navigator.of(context).pop();
              }),

          Container(
            width: 350.0,
            padding: EdgeInsets.only(top: 40.0),
            child: Text('Informe o valor que deseja realizar sua retirada.' ,
                style: TextStyle(fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                    fontSize: 18
                )),
          ),

          ResponsivePadding(
          padding: const EdgeInsets.only(top: 50.0, left: 16.0, right: 16.0),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

            ResponsivePadding(
            padding: const EdgeInsets.only(right: 16.0),
            child: HomeDetailButton(
            bgColor: Colors.green,
            label: 'Valor Disponivel',
            value: 'R\$ 5.000'
            )
            ),

            Container(
              width: 170,
              decoration: new BoxDecoration(
              borderRadius: const BorderRadius.all(const Radius.circular(6.0)),
              color: Colors.deepPurple,
              boxShadow: [
              const BoxShadow(
              color: Colors.black12,
              blurRadius: 3.0,
              offset: Offset(0.0, 5.0)
              )
            ]
            ),
            child: ResponsivePadding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: FlatButton(
              onPressed: null,
                child: Column(
                children: <Widget>[
                Padding(
                padding: const EdgeInsets.only(bottom: 7.0),
                child: Text(
                'Digite o valor',
                style: TextStyle(
                color: CommonColors.white,
                fontFamily: CommonVariables.defaultFont,
                fontSize: CommonVariables(context: context).getSmallFontSize(),
                fontWeight: FontWeight.normal
                )
                )
                ),
                  TextFormField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.white,
                        fontSize: 24
                      ),
                      controller: valorRetirada,
                      decoration: InputDecoration(
                          labelText: 'Insira o valor',
                          labelStyle: CommonStyles(context: context).getLabelText(),
                      ),
                  )
                ]
                )
                )
              )
              ),

            ]
            )
            ),

          ResponsivePadding(
              padding: const EdgeInsets.only(top: 100.0),
              child: ResponsiveContainer(
                  width: 200.0,
                  height: 50.0,

                  child: new FloatingActionButton.extended(
                      heroTag: "btGravar",
                      label: Text("Realizar Retirada"),
                      backgroundColor: Color(0xFF162A49),
                      icon: const Icon(Icons.account_balance),
                      onPressed: () {
                        _cadastrarRetirada();

                      })
              )
          ),
        ]);

    var constrainedBox = new ConstrainedBox(
      constraints:
          constraints.copyWith(maxHeight: MediaQuery.of(context).size.height),
      child: new Container(
          color: Colors.white,
          padding: EdgeInsets.only(
              bottom:
                  CommonVariables(context: context).getScreenPaddingBottom()),
          child: column),
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
