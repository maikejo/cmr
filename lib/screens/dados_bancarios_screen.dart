import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finey/helper/size_config.dart';
import 'package:flutter_finey/screens/ativacao_screen.dart';
import 'package:flutter_finey/service/auth.dart';
import 'package:flutter_finey/styles/common_styles.dart';
import 'dart:math';
import 'common_widgets/responsive_container.dart';
import 'common_widgets/responsive_image.dart';
import 'common_widgets/responsive_padding.dart';

class DadosBancariosScreen extends StatefulWidget {

  @override
  _DadosBancariosScreenState createState() => _DadosBancariosScreenState();
}

class MyCurve extends Curve {
  @override
  double transform(double t) => -pow(t, 2) + 1;
}

class _DadosBancariosScreenState extends State<DadosBancariosScreen>  {

  TextEditingController banco = new TextEditingController();
  TextEditingController numeroConta = new TextEditingController();
  TextEditingController agencia = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void _cadastrarDadosBancarios(){
    Firestore.instance.collection('banco').document(Auth.user.email).collection("lista")
        .add({"numeroConta" : numeroConta.text, "banco": banco.text, "agencia": agencia.text});

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            AtivacaoScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final sizeConfig = SizeConfig(mediaQueryData: MediaQuery.of(context));

    return Scaffold(
      appBar: AppBar(
          title: Text("Dados Bancários"),
          backgroundColor: Color(0xFF162A49)
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              Container(
                  padding: EdgeInsets.only(top: 30.0),
                  child:ResponsiveImage(
                    image: ExactAssetImage("images/icons/ic_banco.png"),
                    width: 100.0,
                    height: 100.0,
                  )
              ),

              Container(
                width: 350.0,
                padding: EdgeInsets.only(top: 40.0),
                child: Text('Os dados bancarios é para que seja possivel realizar suas tranferêcias mensais do seu investimento.' ,
                    style: TextStyle(fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                        fontSize: 18
                    )),
              ),

              SizedBox(height: 20.0),

              SingleChildScrollView(
                  child: Form(
                      child: Column(
                          children: <Widget>[
                            ResponsivePadding(
                                padding: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 24.0),
                                child: TextFormField(
                                  controller: banco,
                                    decoration: InputDecoration(
                                        labelText: 'Banco',
                                        labelStyle: CommonStyles(context: context).getLabelText()
                                    )
                                )
                            ),
                            ResponsivePadding(
                                padding: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 24.0),
                                child: TextFormField(
                                    controller: numeroConta,
                                    decoration: InputDecoration(
                                        labelText: 'Número da conta',
                                        labelStyle: CommonStyles(context: context).getLabelText()
                                    )
                                )
                            ),
                            Row(
                                children: <Widget>[
                                  Container(
                                      width: MediaQuery.of(context).size.width / 2,
                                      child: ResponsivePadding(
                                          padding: const EdgeInsets.only(left: 40.0, bottom: 24.0),
                                          child: TextFormField(
                                              controller: agencia,
                                              decoration: InputDecoration(
                                                  labelText: 'Agência',
                                                  labelStyle: CommonStyles(context: context).getLabelText()
                                              )
                                          )
                                      )
                                  ),
                                  Container(
                                      width: MediaQuery.of(context).size.width / 6,
                                      child: ResponsivePadding(
                                          padding: const EdgeInsets.only(left: 16.0, bottom: 24.0),
                                          child: TextFormField(
                                              decoration: InputDecoration(
                                                  labelText: 'Digito',
                                                  labelStyle: CommonStyles(context: context).getLabelText()
                                              )
                                          )
                                      )
                                  ),
                                ]
                            )
                          ]
                      )
                  ),
              ),

              ResponsivePadding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: ResponsiveContainer(
                      width: 200.0,
                      height: 50.0,

                      child: new FloatingActionButton.extended(
                          heroTag: "btGravar",
                          label: Text("Finalizar Cadastro"),
                          backgroundColor: Color(0xFF162A49),
                          icon: const Icon(Icons.account_balance),
                          onPressed: () {
                           _cadastrarDadosBancarios();
                          })
                  )
              ),
            ],
          ),
        )


      ),
    );
  }
}