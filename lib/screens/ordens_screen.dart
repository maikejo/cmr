import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finey/animation/fade_in_animation.dart';
import 'package:flutter_finey/client/getAccountInfo.dart';
import 'package:flutter_finey/config/application.dart';
import 'package:flutter_finey/config/routes.dart';
import 'package:flutter_finey/model/volatividade.dart';
import 'package:toast/toast.dart';
import 'package:flutter_finey/model/haasbot/completedOrders.dart';

class OrdensScreen extends StatefulWidget {
  OrdensScreen({
    this.ordens
  });

  List<CompletedOrders> ordens;

  @override
  _OrdensScreenState createState() => _OrdensScreenState();
}

class _OrdensScreenState extends State<OrdensScreen> {

  List<Volatividade> listaVolatividade;

  @override
  void initState() {
    super.initState();
    __recuperaVolatividade();
  }

  void __recuperaVolatividade() async{
    List<Volatividade> vol = await GetAccountInfo().getVolatividadeBtc();

    setState(() {
      listaVolatividade = vol;
    });

    Toast.show("Atualizado com sucesso!", context, duration: 3, gravity:  Toast.BOTTOM);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[50],
        appBar: AppBar(
            title: Text("Ordens executadas"),
            backgroundColor: Color(0xFF162A49),
            leading: IconButton(icon:Icon(Icons.arrow_back),
              onPressed:() => Application.router.navigateTo(
                  context, RouteConstants.ROUTE_HOME,
                  transition: TransitionType.fadeIn),
            )
        ),

        body: listaVolatividade != null ? Stack(
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
                margin: EdgeInsets.only(bottom: 20.0),
                width: 400.0,
                height: 800.0,

                child: Container(
                  child: Card(
                    elevation: 6.0,
                    margin: EdgeInsets.only(right: 15.0, left: 15.0),
                    child: new Wrap(
                      children: <Widget>[
                        Container(
                          height: 750.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(100),
                                bottomRight: Radius.circular(100),
                                topLeft: Radius.circular(200),
                                topRight: Radius.circular(200),
                              )
                          ),

                          child: ListView.builder(
                              padding: EdgeInsets.all(12.0),
                              shrinkWrap: true,
                              itemCount: widget.ordens.length,
                              itemBuilder: (context, vol) {

                                return ListTile(
                                  title: FadeIn(1,Card(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                                    color: const Color(0xFFFFFFFF),
                                    elevation: 4.0,
                                    child: ListTile(
                                      /*leading: Container(
                                        child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          backgroundImage: AssetImage('images/icons/ic_curency.png'),
                                          radius: 20.0,
                                        ),
                                      ),*/

                                      title: new Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text('Preço: ' + widget.ordens[vol].price.toStringAsFixed(0) +' - Fee: '+  widget.ordens[vol].fee.toStringAsFixed(2),
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              )),
                                        ],
                                      ),

                                      subtitle: Text('Ganho: ' + widget.ordens[vol].profits.toStringAsFixed(2),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.green[800])
                                      ),
                                      onTap: (() {

                                      }),

                                      onLongPress: (() async{
                                      }),
                                    ),
                                  )),
                                );

                              }
                          ),
                        ),

                      ],
                    ),
                  ),
                ),

              ),
            ),

          ],

        ): Center(
          child: SizedBox(
            height: 30.0,
            width: 30.0,
            child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(
                    Color(0xFF162A49)
                ),
                strokeWidth: 5.0),
          ),
        ));
  }
}