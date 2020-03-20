import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finey/animation/fade_in_animation.dart';
import 'package:flutter_finey/client/getAccountInfo.dart';
import 'package:flutter_finey/model/carteira.dart';
import 'package:flutter_finey/model/haasbot/haasbot_bot.dart';
import 'package:flutter_finey/service/auth.dart';
import 'package:table_calendar/table_calendar.dart';

import '../common_widgets/responsive_padding.dart';
import '../common_widgets/responsive_container.dart';
import '../common_widgets/responsive_image.dart';
import '../../styles/common_styles.dart';
import '../../styles/common_variables.dart';

class HomeListBot extends StatelessWidget {
  HomeListBot({this.get});

  final Future<HaasbotBot> get;

  Widget _buildCardItem(BuildContext context) {

    new Container(
      margin: const EdgeInsets.only(top: 10.0),
      child: new FutureBuilder<HaasbotBot>(
        future: get,
        builder: (BuildContext context, AsyncSnapshot<HaasbotBot> snapshot) {

          if (snapshot.hasData) {
            return new Text(
                'Minha Carteira: ' + snapshot.data.nome,
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 16)
            );
          }
          return SizedBox(
              child:
              new CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation(Colors.blueAccent),
                  strokeWidth: 2.0),
              height: 20.0,
              width: 20.0);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double appBarPaddingTop = CommonVariables(context: context).getAppBarPaddingTop(); 
    double appBarHeight = CommonVariables(context: context).getAppBarHeight(); 
    double headerRowHeight = appBarHeight - appBarPaddingTop;

    return Container(
      child: _buildCardItem(context),
    );

  }
}