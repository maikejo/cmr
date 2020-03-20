import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finey/animation/fade_in_animation.dart';
import 'package:flutter_finey/config/application.dart';
import 'package:flutter_finey/config/routes.dart';
import 'package:flutter_finey/helper/date_converter.dart';
import 'package:flutter_finey/service/auth.dart';
import 'package:intl/intl.dart';

class TransferenciasScreen extends StatefulWidget {

  @override
  _TransferenciasScreenState createState() => _TransferenciasScreenState();
}

class _TransferenciasScreenState extends State<TransferenciasScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
        appBar: AppBar(
            title: Text("Solicitações Depósitos"),
            backgroundColor: Color(0xFF162A49),
            leading: IconButton(icon:Icon(Icons.arrow_back),
              onPressed:() => Application.router.navigateTo(
                  context, RouteConstants.ROUTE_HOME,
                  transition: TransitionType.fadeIn),
            )
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
                 /* borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100),
                      bottomRight: Radius.circular(100)
                  )*/
              ),
            ),

            new Center(
              child: new Container(
                margin: EdgeInsets.only(bottom: 70.0),
                width: 400.0,
                height: 600.0,

                child: Container(
                  child: Card(
                    elevation: 6.0,
                    margin: EdgeInsets.only(right: 15.0, left: 15.0),
                    child: new Wrap(
                      children: <Widget>[
                        Container(
                          height: 570.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(100),
                                  bottomRight: Radius.circular(100),
                                  topLeft: Radius.circular(200),
                                  topRight: Radius.circular(200),
                              )
                          ),

                          child: ListView(
                            padding: EdgeInsets.all(12.0),
                            children: <Widget>[
                              SizedBox(height: 20.0),
                              StreamBuilder<QuerySnapshot>(
                                  stream: Firestore.instance.collection("transferencia").document(Auth.user.email).collection("lista").snapshots(),
                                  builder: (context, snapshot) {

                                    if (snapshot.hasData) {


                                      return Column(
                                        children: snapshot.data.documents.map((doc) {

                                          var dataAplicacao  = DateConverter().converteTimestamp(doc.data['data'].millisecondsSinceEpoch);

                                          return ListTile(
                                            title: FadeIn(1,Card(
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                                              color: const Color(0xFFFFFFFF),
                                              elevation: 4.0,
                                              child: ListTile(
                                                leading: Container(
                                                  child: CircleAvatar(
                                                    backgroundImage: AssetImage('images/icons/ic_banco.png'),
                                                    radius: 20.0,
                                                  ),
                                                ),

                                                title: new Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: <Widget>[
                                                    Text(dataAplicacao.toString(),
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight: FontWeight.bold,
                                                        )),
                                                  ],
                                                ),

                                                subtitle: Text('Valor: ' + doc.data['valor'],
                                                    style: TextStyle(
                                                      color: Colors.grey)
                                                ),
                                                  onTap: (() {

                                                  }),

                                                onLongPress: (() async{
                                                }),
                                              ),
                                            )),
                                          );
                                        }).toList(),
                                      );
                                    } else {
                                      return SizedBox();
                                    }
                                  }),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ),

              ),
            ),

          ],

    ));
  }
}