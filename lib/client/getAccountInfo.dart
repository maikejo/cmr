import 'dart:convert';
import 'dart:io';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_finey/model/carteira.dart';
import 'package:flutter_finey/model/haasbot/haasbot_bot.dart';
import 'package:flutter_finey/model/volatividade.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter_finey/util/hmacSha512.dart';
import 'package:intl/intl.dart';
import 'package:flutter_finey/model/haasbot/completedOrders.dart';
import 'package:flutter_finey/helper/date_converter.dart';

class GetAccountInfo {

  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  Future<Carteira> postAccountInfo() async {
    Dio _dio = Dio();
    _dio.options.baseUrl = "https://www.mercadobitcoin.net";
    var path = "/tapi/v3/";

    int timeStamp = DateTime.now().millisecondsSinceEpoch;
    String queryParams = '/tapi/v3/?tapi_method=get_account_info&tapi_nonce=' + timeStamp.toString();
    String secret = '';
    String signature = new HmacSha512().hmacSha512(queryParams, secret);

    Response response = await _dio.post(path,
        data: {
          "tapi_method": 'get_account_info',
          "tapi_nonce": timeStamp.toString()
        },
        options: Options(
            contentType: ContentType.parse("application/x-www-form-urlencoded"),
            headers: {'TAPI-ID': '',
              'TAPI-MAC': signature}
        )
    );

    if (response.statusCode == 200) {

      Carteira carteira = Carteira();
      carteira.brl = response.data["response_data"]["balance"]["brl"]["total"];
      carteira.btc = response.data["response_data"]["balance"]["btc"]["total"];

      return carteira;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<HaasbotBot> postHaasBotAccountInfo() async {
    var key = utf8.encode('');
    var bytes = utf8.encode('');
    var hmacSha256 = new Hmac(sha256, key); // HMAC-SHA256
    var digest = hmacSha256.convert(bytes);
    String assinatura = digest.toString().replaceAll("-", "").toUpperCase();

    try{
      final response = await http.get('http://35.246.71.175:9000/AllCustomBots?sig='+ assinatura);

      if (response.statusCode == 200) {
        List<HaasbotBot> lista = [];
        HaasbotBot haasbotBot;

        final jsonData = json.decode(response.body);
        final resposnses = jsonData['Result'];

        for(var bot in resposnses){

          if(bot['Name'] == 'BTC/TUSD'){
            haasbotBot = new HaasbotBot(nome: bot['Name'],roi: bot['ROI'],vlInvestido: bot['CurrentTradeAmount']);
          }
        }

        return haasbotBot;

      }
    }catch(e){
      //Toast.show("Serviço indisponivel !", null, duration: 3, gravity:  Toast.BOTTOM);
    }

  }

  Future<List<HaasbotBot>> postHaasBotAccountInfoAdmin() async {
    var key = utf8.encode('');
    var bytes = utf8.encode('');
    var hmacSha256 = new Hmac(sha256, key); // HMAC-SHA256
    var digest = hmacSha256.convert(bytes);
    String assinatura = digest.toString().replaceAll("-", "").toUpperCase();

    try{
      //final response = await http.get('http://192.168.100.4:9000/AllCustomBots?sig='+ assinatura);
      final response = await http.get('http://35.246.71.175:9000/AllCustomBots?sig='+ assinatura);

      if (response.statusCode == 200) {
        List<HaasbotBot> lista = [];
        List<CompletedOrders> listaOrdens = [];
        HaasbotBot haasbotBot;
        CompletedOrders completedOrders;

        final jsonData = json.decode(response.body);
        final resposnses = jsonData['Result'];


        for(var bot in resposnses){

          for(var orders in bot['CompletedOrders']){

            String data = DateConverter().converteTimestamp(orders['UnixAddedTime']);

            completedOrders = new CompletedOrders(price: orders['Price'],fee: orders['FeeCosts'],profits: orders['Profits'],data: data);
            listaOrdens.add(completedOrders);
          }

          //listaOrdens = bot['CompletedOrders'];

          haasbotBot = new HaasbotBot(nome: bot['Name'],roi: bot['ROI'],vlInvestido: bot['CurrentTradeAmount'],ordensCompletas: listaOrdens,posicaoCorrente: bot['CurrentPositionPl']);
          lista.add(haasbotBot);
        }

        return lista;

      }
    }catch(e){
      print(e);
      //Toast.show("Serviço indisponivel !", null, duration: 3, gravity:  Toast.BOTTOM);
    }

  }

  Future<List<Volatividade>> getVolatividadeBtc() async {
    List<Volatividade> lista = [];
    double volume60 = 0.0;
    String data;
    Volatividade volatividade;

    try{
      final response = await http.get('https://www.satochi.co/all');

      if (response.statusCode == 200) {

        final jsonData = json.decode(response.body);


        for(var vol in jsonData){

        if(vol['Date'].toString().contains('2020')){

          if(vol['Volatility60'] == 0){
            volume60 = 0.0;
          }else{
            volume60 = vol['Volatility60'];
          }

          data = vol['Date'].toString();
          volatividade = new Volatividade(data: data,volatility: vol['Volatility'],volatility60: volume60);
          lista.add(volatividade);
        }

        }

        return lista;

      }
    }catch(e){

    }

  }


  Future<HaasbotBot> binance() async {
    var key = utf8.encode('');
    var bytes = utf8.encode('');
    var hmacSha256 = new Hmac(sha256, key); // HMAC-SHA256
    var digest = hmacSha256.convert(bytes);
    String assinatura = digest.toString().replaceAll("-", "").toUpperCase();

    try{
      final response = await http.get('https://api.binance.com//api/v3/time');

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
      }
    }catch(e){
      //Toast.show("Serviço indisponivel !", null, duration: 3, gravity:  Toast.BOTTOM);
    }

  }

  var secretApiHash = null;

  Future<Carteira> binanceAccount() async {

    String baseUrl = 'https://api.binance.com/api/v3/account?';
    int timeStamp = DateTime.now().millisecondsSinceEpoch;
    String queryParams = 'recvWindow=5000' + '&timestamp=' + timeStamp.toString();
    String secret = '';

    List<int> messageBytes = utf8.encode(queryParams);
    List<int> key = utf8.encode(secret);
    Hmac hmac = new Hmac(sha256, key);
    Digest digest = hmac.convert(messageBytes);
    String signature = hex.encode(digest.bytes);
    String url = baseUrl + queryParams + "&signature=" + signature;
    secretApiHash = signature;

    var response = await http.get(
        url,
        headers: {
          "Accept": "application/json",
          "HTTP_ACCEPT_LANGUAGE": "en-US",
          "Accept-Language": "en-US",
          "X-MBX-APIKEY": ""
        }
    );

    print(response.body);
  }

  void haskey (){

  }

  Future<Carteira> binanceOrdensAbertas() async {

    String baseUrl = 'https://api.binance.com/api/v3/openOrderList?';
    int timeStamp = DateTime.now().millisecondsSinceEpoch;
    String queryParams = 'recvWindow=5000' + '&timestamp=' + timeStamp.toString();
    String secret = '';

    List<int> messageBytes = utf8.encode(queryParams);
    List<int> key = utf8.encode(secret);
    Hmac hmac = new Hmac(sha256, key);
    Digest digest = hmac.convert(messageBytes);
    String signature = hex.encode(digest.bytes);
    String url = baseUrl + queryParams + "&signature=" + signature;

    var response = await http.get(
        url,
        headers: {
          "Accept": "application/json",
          "HTTP_ACCEPT_LANGUAGE": "en-US",
          "Accept-Language": "en-US",
          "X-MBX-APIKEY": ""
        }
    );

    print(response.body);
  }

}