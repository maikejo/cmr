import 'package:flutter/material.dart';
import 'package:flutter_finey/helper/size_config.dart';
import 'package:flutter_finey/screens/login_screen.dart';
import 'dart:math';

import 'common_widgets/responsive_container.dart';
import 'common_widgets/responsive_image.dart';
import 'common_widgets/responsive_padding.dart';

class AtivacaoScreen extends StatefulWidget {

  @override
  _AtivacaoScreenState createState() => _AtivacaoScreenState();
}

class MyCurve extends Curve {
  @override
  double transform(double t) => -pow(t, 2) + 1;
}

class _AtivacaoScreenState extends State<AtivacaoScreen>  {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sizeConfig = SizeConfig(mediaQueryData: MediaQuery.of(context));

    return Scaffold(
      appBar: AppBar(
          title: Center(child: Text("Ativação de acesso")),
          backgroundColor: Color(0xFF162A49),
          automaticallyImplyLeading: false,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: sizeConfig.dynamicScaleSize(size: 1000),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            Container(
              width: 300.0,
              padding: EdgeInsets.only(top: 50.0),
              child: Text('Aguarde...Estamos validando seu cadastro.' ,
                  style: TextStyle(fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                      fontSize: 24
                  )),
            ),

            Container(
              padding: EdgeInsets.only(top: 30.0),
              child:ResponsiveImage(
                image: ExactAssetImage("images/icons/ic_ativacao.png"),
                width: 200.0,
                height: 200.0,
              )
            ),

            Container(
              width: 350.0,
              padding: EdgeInsets.only(top: 20.0),
              child: Text('Está sendo verificado seus documentos. Em breve será notificado sobre sua ativação.' ,
                  style: TextStyle(fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                      fontSize: 18
                  )),
            ),

            ResponsivePadding(
                padding: const EdgeInsets.only(top: 40.0),
                child: ResponsiveContainer(
                    width: 200.0,
                    height: 50.0,

                    child: new FloatingActionButton.extended(
                        heroTag: "btFechar",
                        label: Text("Fechar"),
                        backgroundColor: Color(0xFF162A49),
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  LoginScreen(),
                            ),
                          );
                        })
                )
            ),
          ],
        ),
      ),
    );
  }
}