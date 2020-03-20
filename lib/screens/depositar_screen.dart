import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finey/config/application.dart';
import 'package:flutter_finey/config/routes.dart';
import 'package:flutter_finey/helper/Email.dart';
import 'package:flutter_finey/screens/transferencias.dart';
import 'package:flutter_finey/service/auth.dart';
import 'package:flutter_finey/styles/common_colors.dart';
import 'package:flutter_finey/styles/common_styles.dart';
import 'package:flutter_finey/styles/common_variables.dart';
import 'package:toast/toast.dart';

import 'common_widgets/responsive_padding.dart';

class DepositoScreen extends StatefulWidget {
  DepositoScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DepositoScreenState createState() => new _DepositoScreenState();
}

class _DepositoScreenState extends State<DepositoScreen> {

  TextEditingController valorDeposito = new TextEditingController();

  String _text = '';
  var email = Email('suportecmr01@gmail.com', 'cmr_1nv3st1men0s#');

    void _enviarEmailDeposito() async {
      bool result = await email.sendMessage(
          'Foi solicitado pelo cliente: ' + Auth.user.email +
              ' o depósito no valor de: R\$ '+valorDeposito.text+'. Aguarde 01 dia útil e verifique na conta.',
          Auth.user.email,'suportecmr01@gmail.com', 'Solicitação de Depósito');

      setState(() {
        _text = result ? 'Enviado.' : 'Não enviado.';
      });
    }

    void _cadastrarDeposito() async{
    Firestore.instance.collection('transferencia').document(Auth.user.email).collection("lista")
        .add({"data": DateTime.now(), "valor": valorDeposito.text});

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            TransferenciasScreen(),
      ),
    );

    _enviarEmailDeposito();

    Toast.show("Solicitação enviada com sucesso.Foi enviado um email da solicitação.", context, duration: 3, gravity:  Toast.BOTTOM);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[50],
        appBar: AppBar(
            title: Text("Solicitar Depósito"),
            backgroundColor: Color(0xFF162A49),
            leading: IconButton(icon:Icon(Icons.arrow_back),
              onPressed:() => Application.router.navigateTo(
                  context, RouteConstants.ROUTE_HOME,
                  transition: TransitionType.fadeIn),
            )
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton.extended(
            label: const Text('Solicitar depósito'),
            elevation: 4.0,
            icon: const Icon(Icons.account_balance),
            heroTag: "btFotoExame",
            backgroundColor: Color(0xFF162A49),
            onPressed: _cadastrarDeposito
        ),

        body: Stack(
          children: <Widget>[

            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/5.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF162A49),
                    Color(0xFF162A49),
                  ],
                ),
              ),
            ),

             Center(
              child: new Container(
                margin: EdgeInsets.only(bottom: 400.0),
                width: 400.0,
                height: 220.0,

                child: Container(
                  child: Card(
                    elevation: 6.0,
                    margin: EdgeInsets.only(right: 15.0, left: 15.0),
                    child: new Wrap(
                      children: <Widget>[

                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(100),
                                bottomRight: Radius.circular(100),
                                topLeft: Radius.circular(200),
                                topRight: Radius.circular(200),
                              )
                          ),

                          child: Column(children: <Widget>[

                            Container(
                              width: 350.0,
                              padding: EdgeInsets.only(top: 40.0,left: 100.0),
                              child: Text('Depositar na conta:' ,
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18
                                  )),
                            ),

                            SizedBox(height: 20.0),

                            Container(

                              width: 350.0,
                              padding: EdgeInsets.only(top: 20.0,left: 10.0),
                              child: Text('Banco: Nubank' ,
                                  style: TextStyle(fontWeight: FontWeight.bold,
                                      color: Color(0xFF162A49),
                                      fontSize: 18
                                  )),
                            ),

                            Container(
                              width: 350.0,
                              padding: EdgeInsets.only(top: 10.0,left: 10.0),
                              child: Text('Número da Conta: 1000378' ,
                                  style: TextStyle(fontWeight: FontWeight.bold,
                                      color: Color(0xFF162A49),
                                      fontSize: 18
                                  )),
                            ),

                            Container(
                              width: 350.0,
                              height: 50.0,
                              padding: EdgeInsets.only(top: 10.0,left: 10.0),
                              child: Text('Agência: 239-6' ,
                                  style: TextStyle(fontWeight: FontWeight.bold,
                                      color: Color(0xFF162A49),
                                      fontSize: 18
                                  )),
                            ),

                          ]
                          ),

                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),

            Center(
              child: new Container(
                margin: EdgeInsets.only(top: 100.0),
                width: 320.0,
                height: 200.0,

                child: ResponsivePadding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Container(
                        decoration: BoxDecoration(
                            color: CommonColors.blue,
                            borderRadius: const BorderRadius.all(const Radius.circular(10.0))
                        ),
                        child: ResponsivePadding(
                            padding: const EdgeInsets.only(top: 24.0, bottom: 36.0),
                            child: Column(
                                children: <Widget>[
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        InkWell(
                                            child: Text(
                                                "Informe o valor",
                                                style: CommonStyles(context: context).getWhiteNormalText()
                                            ),

                                        ),
                                      ]
                                  ),
                                  ResponsivePadding(
                                    padding: const EdgeInsets.only(top: 24.0,left: 15.0),
                                    child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                              "R\$",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 40.0,
                                                  fontFamily: CommonVariables.defaultFont,
                                                  fontWeight: FontWeight.normal
                                              )
                                          ),
                                          Container(
                                              width: 210.0,
                                              child: TextField(
                                                controller: valorDeposito,
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      hintText: "00.000,00",
                                                      fillColor: Colors.white,
                                                      hintStyle: TextStyle(color: Colors.white)
                                                  ),
                                                  keyboardType: TextInputType.number,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 40.0,
                                                      fontFamily: CommonVariables.defaultFont,
                                                      fontWeight: FontWeight.normal
                                                  )
                                              )
                                          )
                                        ]
                                    ),
                                  )
                                ]
                            )
                        )
                    )
                ),
              ),
            ),

          ],

        ));
  }
}
