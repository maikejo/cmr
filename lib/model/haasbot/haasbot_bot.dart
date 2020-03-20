import 'package:flutter_finey/model/haasbot/completedOrders.dart';

class HaasbotBot {
  HaasbotBot({this.nome, this.roi,this.vlInvestido,this.ordensCompletas,this.posicaoCorrente});

  String nome;
  double roi;
  double vlInvestido;
  List<CompletedOrders> ordensCompletas;
  double posicaoCorrente;
}