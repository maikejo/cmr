import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as clound;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_finey/animation/fade_in_animation.dart';
import 'package:flutter_finey/client/getAccountInfo.dart';
import 'package:flutter_finey/model/haasbot/haasbot_bot.dart';
import 'package:flutter_finey/model/transaction.dart';
import 'package:flutter_finey/model/user.dart';
import 'package:flutter_finey/sample_data/transactions.dart';
import 'package:flutter_finey/screens/bancos.dart';
import 'package:flutter_finey/screens/retirada_screen.dart';
import 'package:flutter_finey/screens/retiradas.dart';
import 'package:flutter_finey/screens/transferencia.dart';
import 'package:flutter_finey/screens/transferencias.dart';
import 'package:flutter_finey/service/auth.dart';
import 'package:intl/intl.dart';
import '../config/application.dart';
import '../config/routes.dart';
import './common_widgets/finey_drawer.dart';
import './common_widgets/responsive_padding.dart';
import './home_widgets/home_header.dart';
import './home_widgets/home_bar.dart';
import './home_widgets/home_detail_button.dart';
import './home_widgets/home_detail_card.dart';
import '../styles/common_colors.dart';
import '../styles/common_styles.dart';
import '../styles/common_variables.dart';
import 'common_widgets/responsive_image.dart';
import 'package:toast/toast.dart';
import 'package:flutter_finey/model/haasbot/completedOrders.dart';
import 'package:flutter_finey/screens/ordens_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   final GlobalKey<State> _keyLoader = new GlobalKey<State>();
   FirebaseUser firebaseUser;
   String carteira;
   final db = clound.Firestore.instance;
   HaasbotBot haasbotBot;
   List<HaasbotBot> listaHaasBotAdm;
   List<CompletedOrders> listaOrdens = [];
   User user;

   @override
   void initState() {
     super.initState();
     GetAccountInfo().binanceAccount();
     //GetAccountInfo().binanceOrdensAbertas();
     //_recuperarDadosBot();
     _recuperaUser();
     _recuperaDadosUser();

   }

  void _recuperaUser() async{
    FirebaseUser _firebaseUser = await Auth.getCurrentFirebaseUser();
      setState(() {
        firebaseUser = _firebaseUser;
      });
  }

   void _recuperarDadosBot() async{
     HaasbotBot _haas = await GetAccountInfo().postHaasBotAccountInfo();
       setState(() {
         haasbotBot = _haas;
       });

     Toast.show("Atualizado com sucesso!", context, duration: 3, gravity:  Toast.BOTTOM);
   }

   void _recuperarDadosBotAdm() async{
     List<HaasbotBot> _listaHaas = await GetAccountInfo().postHaasBotAccountInfoAdmin();

     setState(() {
       listaHaasBotAdm = _listaHaas;
     });

     Toast.show("Atualizado com sucesso!", context, duration: 3, gravity:  Toast.BOTTOM);
   }

    _recuperaDadosUser() async{
     User dadosUser = await Auth.getDadosUser(Auth.user.email);

       setState(() {
         user = dadosUser;
       });

       if(user.tipo == 'ADM'){
         _recuperarDadosBotAdm();
       }

   }


  void _redirectAddBankScreen() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        context: context,
        builder: (BuildContext context) {
          return TransferenciaScreen();
        }
    );
  }

   void _redirectRetiradaScreen() {
     Navigator.push(
       context,
       MaterialPageRoute(
         builder: (context) => RetiradasScreen(),
       ),
     );

   /*  showModalBottomSheet(
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(40.0),
         ),
         context: context,
         builder: (BuildContext context) {
           return RetiradasScreen();
         }
     );*/
   }

   void _redirectDepositoScreen() {
     Navigator.push(
       context,
       MaterialPageRoute(
         builder: (context) => TransferenciasScreen(),
       ),
     );

   /*  showModalBottomSheet(
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(40.0),
         ),
         context: context,
         builder: (BuildContext context) {
           return TransferenciasScreen();
         }
     );*/
   }

  void _redirectChartScreen() {
    Application.router.navigateTo(context, RouteConstants.ROUTE_CHART, transition: TransitionType.fadeIn);
  }

   void _redirectBancoScreen() {
     Navigator.push(
       context,
       MaterialPageRoute(
         builder: (context) => BancoScreen(),
       ),
     );
   }

   void _redirectHomeScreen() {
     Application.router.navigateTo(context, RouteConstants.ROUTE_HOME, transition: TransitionType.fadeIn);
   }

  Widget _buildSummaryBox(context) {
    return ResponsivePadding(
      padding: const EdgeInsets.only(top: 24.0, left: 16.0, right: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[


          haasbotBot != null ?

          ResponsivePadding(
            padding: const EdgeInsets.only(right: 16.0),
            child: HomeDetailButton(
            bgColor: CommonColors.blue,
            label: 'Dinheiro Investido',
            value: 'BTC: '+haasbotBot.vlInvestido.toString()
            )
          ): ResponsivePadding(
              padding: const EdgeInsets.only(right: 16.0),
              child: HomeDetailButton(
                  bgColor: CommonColors.blue,
                  label: 'Dinheiro Investido',
                  value: 'BTC: --'
              )
          ),

          HomeDetailButton(
            bgColor: CommonColors.red,
            label: "Ultima Retirada",
            value: "R\$ 5.000,00"
          )
        ]
      )
    );
  }

  Widget _buildCategoryTitle(context, String title) {
    return ResponsivePadding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),

      child: Row(
        children: <Widget>[
          Text(
              title,
              style: TextStyle(
                  color: CommonColors.gray,
                  fontSize: CommonVariables(context: context).getSmallFontSize(),
                  fontFamily: CommonVariables.defaultFont,
                  fontWeight: FontWeight.w600
              )
          ),

          SizedBox(width: 120.0),

          GestureDetector(
            onTap: user != null && user.tipo == 'ADM' ? _recuperarDadosBotAdm : _recuperarDadosBot,
            child: ResponsiveImage(
                image: new ExactAssetImage("images/icons/ic_refresh.png"),
                width: 40.0,
                height: 40.0)
          ),
        ],
      ),



    );
  }

  Widget _buildCardItem(BuildContext context) {
    List<String> shortMonths = <String>['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dec'];
    List<Widget> list = new List<Widget>();

    DateTime now = DateTime.now();
    String dia = DateFormat('dd').format(now);
    String mes = DateFormat('MMM').format(now);

    if(user != null){

      //listaHaasBotAdm.add(new HaasbotBot(nome: 'TESTE',vlInvestido: 1,roi: 1));

      //if(user.tipo == 'ADM' && this.listaHaasBotAdm != null){
      /* for (var bot in listaHaasBotAdm) {
            list.add(

                HomeDetailCard(
                  date: dia,
                  day: mes,
                  categoryName: 'Investimento',
                  categoryIcon: new ExactAssetImage('images/icons/logo2.png'),
                  category: bot != null ? bot.nome : '--',
                  money: bot != null ? bot.roi.toString() : '--',
                  moneyTextStyle: CommonStyles(context: context)
                      .getBlueNormalText(),
                  ordens: bot.ordensCompletas,
                  currentPosition: bot.posicaoCorrente,
                )
            );
          }*/

      if(user.tipo == 'ADM'){

         return HomeDetailCard(
              date: "24/12",
              day: "Dias 1",
              categoryName: "CM Estratégia",
              categoryIcon: new ExactAssetImage('images/icons/logo2.png'),
              category: "BTC/USDT",
              money: "1.000",
              currentPosition: 0.29,
              moneyTextStyle: CommonStyles(context: context).getBlueNormalText()
          );

      }else if(user.tipo == 'CLI' && listaHaasBotAdm != null){

          for(var i = 0; i < 1; i++){

          list.add(
              HomeDetailCard(
                  date: dia,
                  day: mes,
                  categoryName: 'Investimento',
                  categoryIcon: new ExactAssetImage('images/icons/logo2.png'),
                  category: haasbotBot != null ? haasbotBot.nome : '--',
                  money: haasbotBot != null ? haasbotBot.roi.toString() : '--',
                  moneyTextStyle: CommonStyles(context: context).getBlueNormalText()
              )
          );
        }
      }
    }

    return ResponsivePadding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
      child: Column (
        children: list
      )
    );
  }

  Widget _buildWithConstraints(BuildContext context, BoxConstraints constraints) {
    var column = new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[

        HomeHeader(post: GetAccountInfo().postAccountInfo()),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildSummaryBox(context),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(top: 30.0),
                  children: <Widget>[
                    _buildCategoryTitle(context, "RENDIMENTO DA SUA CARTEIRA"),
                    //HomeListBot(get: GetAccountInfo().postHaasBotAccountInfo()),
                    _buildCardItem(context),
                   /* _buildCategoryTitle(context, "ONTEM"),
                    _buildCardItem(context)*/
                  ]
                )
              )
            ]
          )
        ),


        HomeBar(
          handleClickChartButton: _redirectChartScreen,
          handleClickMainButton: _redirectHomeScreen,
          handleClickWalletButton: _redirectAddBankScreen,
          handleClickListaRetiradaButton: _redirectRetiradaScreen,
          handleClickListaDepositoButton: _redirectDepositoScreen,
        ),

      ]
    );

    var constrainedBox = new ConstrainedBox(
      constraints: constraints.copyWith(
        maxHeight: MediaQuery.of(context).size.height
      ),
      child: new Container(
        color: Colors.white,
        //padding: EdgeInsets.only(bottom: CommonVariables(context: context).getScreenPaddingBottom()),
        child: column
      )
    );

    var scrollView = new SingleChildScrollView(
      child: constrainedBox
    );

    return scrollView;
  }

  @override
  Widget build(BuildContext context) {
    var layoutBuilder = new LayoutBuilder(
      builder: _buildWithConstraints
    );

    var scaffold = new Scaffold(
      body: layoutBuilder,
      drawer: FineyDrawer(
        rootContext: context,
        currentPath: RouteConstants.ROUTE_HOME,
        firebaseUser: firebaseUser
      )
    );
    return scaffold;
  }
}