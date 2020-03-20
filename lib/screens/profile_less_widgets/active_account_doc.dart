import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_finey/model/documentacao.dart';
import 'package:flutter_finey/service/auth.dart';
import '../common_widgets/shadow_card.dart';
import '../common_widgets/responsive_padding.dart';
import '../../styles/common_styles.dart';
import '../../styles/common_colors.dart';


class ActiveAccountDoc extends StatelessWidget {

  ActiveAccountDoc({
    this.labelText,
    this.value,
    this.icon,
    this.iconWidth,
    this.iconHeight,
    this.onPressItem,
    this.image,
    this.photo
  });

  final String labelText;
  final String value;
  final String icon;
  final double iconHeight;
  final double iconWidth;
  final Function onPressItem;
  final String image;
  final File photo;

  @override
  Widget build(BuildContext context) {
    return ShadowCardWidget(
      paddingVertical: 18.0,
      child: Row(
        children: <Widget>[

          Container(
            child: FutureBuilder(
                future: Auth.getDocumentacao(Auth.user.email),
                builder: (BuildContext context, AsyncSnapshot<Documentacao> snapshot) {

                  if (snapshot.data != null) {

                    if(photo != null){
                     return Container(
                        width: 50,
                        height: 50,
                        child: photo != null
                            ? Image.file(photo)
                            : Text(''),
                      );
                    }else{
                      var doc = null;
                      if(image == "urlDocIdentificacao"){
                        doc = snapshot.data.urlDocIdentificacao;
                      }
                      if(image == "urlDocSelf"){
                        doc = snapshot.data.urlDocSelf;
                      }
                      if(image == "urlDocResidencia"){
                        doc = snapshot.data.urlDocResidencia;
                      }

                      return Container(
                        margin: const EdgeInsets.only(right: 5.0,left: 5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: iconHeight,
                              width: iconWidth,
                              child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                backgroundImage: (doc != '')
                                    ? NetworkImage(doc)
                                    : AssetImage(icon),
                              ),
                            ),

                          ],
                        ),
                      );
                    }

                  }else{
                    return SizedBox(
                        child:
                        new CircularProgressIndicator(
                            valueColor: new AlwaysStoppedAnimation(Colors.blue),
                            strokeWidth: 5.0),
                        height: 30.0,
                        width: 30.0);
                  }
                }),
          ),

          new Container(
            width: 2.0,
            height: 48.0,
            color: CommonColors.lightGray,
            margin: const EdgeInsets.only(right: 8.0,left: 3.0)
          ),
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ResponsivePadding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  labelText,
                  style: CommonStyles(context: context).getBlackNormalText()
                )
              ),
              new Text(
                value,
                style: CommonStyles(context: context).getGrayNormalText()
              )
            ]
          )
        ]
      ),
      onPressItem: onPressItem
    );
  }
}