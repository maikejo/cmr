import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_finey/helper/size_config.dart';
import 'package:flutter_finey/screens/retirada_screen.dart';
import 'package:flutter_finey/util/dialog.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'common_widgets/responsive_container.dart';
import 'common_widgets/responsive_padding.dart';
import 'depositar_screen.dart';

class TransferenciaScreen extends StatefulWidget {

  @override
  _TransferenciaScreenState createState() => _TransferenciaScreenState();
}

class _TransferenciaScreenState extends State<TransferenciaScreen> with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sizeConfig = SizeConfig(mediaQueryData: MediaQuery.of(context));

    return Container(
      width: MediaQuery.of(context).size.width,
      height: sizeConfig.dynamicScaleSize(size: 1000),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          ResponsivePadding(
            padding: EdgeInsets.only(top: 20.0),
            child: Text('Tipo de transação' ,
                style: TextStyle(fontWeight: FontWeight.bold,
                    color: Color(0xFF162A49),
                    fontSize: 24
                )),
          ),

          Container(
            padding: EdgeInsets.only(top: 30.0),
            child: new CircleAvatar(
              radius: 40.0,
              backgroundImage: AssetImage(
                  "images/icons/ic_banco.png"),
            ),
          ),

          Container(
            width: 300.0,
            padding: EdgeInsets.only(top: 20.0,left: 30.0),
            child: Text('Selecione uma das opções: ' ,
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
                      heroTag: "btDescobrirPet",
                      label: Text("Depositar fundos"),
                      backgroundColor: Color(0xFF162A49),
                      icon: const Icon(Icons.account_balance),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DepositoScreen(),
                          ),
                        );
                      })
              )
          ),

          ResponsivePadding(
              padding: const EdgeInsets.only(top: 40.0),
              child: ResponsiveContainer(
                  width: 200.0,
                  height: 50.0,

                  child: new FloatingActionButton.extended(
                      heroTag: "btRetirarFundos",
                      label: Text("Retirar fundos"),
                      backgroundColor: Colors.green,
                      icon: const Icon(Icons.autorenew),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                RetiradaScreen(),
                          ),
                        );
                      })
              )
          ),
        ],
      ),
    );
  }
}