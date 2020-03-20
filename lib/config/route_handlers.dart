import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_finey/screens/bancos.dart';
import 'package:flutter_finey/screens/volatividade.dart';

import '../screens/home_screen.dart';
import '../screens/create_wallet_screen.dart';
import '../screens/signup_screen.dart';
import '../screens/forgot_password_screen.dart';
import '../screens/login_screen.dart';
import '../screens/list_wallet_screen.dart';
import '../screens/information_screen.dart';
import '../screens/profile_guest_screen.dart';
import '../screens/documentos_screen.dart';
import '../screens/profile_more_screen.dart';
import '../screens/profile_premium_screen.dart';
import '../screens/report_screen.dart';
import '../screens/settings_profile_screen.dart';
import '../screens/add_transaction_screen.dart';
import '../screens/splash_screen.dart';
import '../screens/walk_through_screen.dart';
import '../screens/retirada_screen.dart';
import '../screens/chart_screen.dart';
import '../screens/premium_account_screen.dart';
import '../screens/add_wallet_screen.dart';
import '../screens/category_screen.dart';
import '../screens/verify_code_screen.dart';

/// Handler redirect to Home screen
var homeHandler = new Handler(handlerFunc: (
  BuildContext context, Map<String, List<String>> params
  ) {
  return new HomeScreen();
});

/// Handler redirect to Sign up screen
var signUpHandler = new Handler(handlerFunc: (
  BuildContext context, Map<String, List<String>> params
  ) {
  return new SignupScreen();
});

/// Handler redirect to Verify code screen
var verifyCodeHandler = new Handler(handlerFunc: (
  BuildContext context, Map<String, List<String>> params
  ) {
  return new VerifyCodeScreen();
});

/// Handler redirect to Create wallet screen
var createWalletHandler = new Handler(handlerFunc: (
  BuildContext context, Map<String, List<String>> params
  ) {
  return new CreateWalletScreen();
});

var loginHandler = new Handler(handlerFunc: (
  BuildContext context, Map<String, List<String>> params
  ) {
  return new LoginScreen();
});

var forgotPasswordHandler = new Handler(handlerFunc: (
  BuildContext context, Map<String, List<String>> params
  ) {
  return new ForgotPasswordScreen();
});

var listWalletHandler = new Handler(handlerFunc: (
  BuildContext context, Map<String, List<String>> params
  ) {
  return new ListWalletScreen();
});

var informationHandler = new Handler(handlerFunc: (
  BuildContext context, Map<String, List<String>> params
  ) {
  return new InformationScreen();
});

var profileGuestHandler = new Handler(handlerFunc: (
  BuildContext context, Map<String, List<String>> params
  ) {
  return new ProfileGuestScreen();
});

var profileLessHandler = new Handler(handlerFunc: (
  BuildContext context, Map<String, List<String>> params
  ) {
  return new DocumentosScreen();
});

var profileMoreHandler = new Handler(handlerFunc: (
  BuildContext context, Map<String, List<String>> params
  ) {
  return new ProfileMoreScreen();
});

var profilePremiumHandler = new Handler(handlerFunc: (
  BuildContext context, Map<String, List<String>> params
  ) {
  return new ProfilePremiumScreen();
});

var reportHandler = new Handler(handlerFunc: (
  BuildContext context, Map<String, List<String>> params
  ) {
  return new ReportScreen();
});

var settingsProfileHandler = new Handler(handlerFunc: (
  BuildContext context, Map<String, List<String>> params
  ) {
  return new SettingsProfileScreen();
});


var addTransactionHandler = new Handler(handlerFunc: (
    BuildContext context, Map<String, List<String>> params
    ) {
  return new AddTransactionScreen();
});

var splashHandler = new Handler(handlerFunc: (
    BuildContext context, Map<String, List<String>> params
    ) {
  return new SplashScreen();
});

// router.define(RouteConstants.ROUTE_WALK_THROUGH, handler: null);
var walkThroughHandler = new Handler(handlerFunc: (
    BuildContext context, Map<String, List<String>> params
    ) {
  return new WalkThroughScreen();
});

// router.define(RouteConstants.ROUTE_ADD_BANK, handler: null);
var addBankHandler = new Handler(handlerFunc: (
    BuildContext context, Map<String, List<String>> params
    ) {
  return new RetiradaScreen();
});

// router.define(RouteConstants.ROUTE_CHART, handler: null);
var chartHandler = new Handler(handlerFunc: (
    BuildContext context, Map<String, List<String>> params
    ) {
  return new ChartScreen();
});

// router.define(RouteConstants.ROUTE_PREMIUM_ACCOUNT, handler: null);
var premiumAccountHandler = new Handler(handlerFunc: (
    BuildContext context, Map<String, List<String>> params
    ) {
  return new PremiumAccountScreen();
});

// router.define(RouteConstants.ROUTE_ADD_WALLET, handler: null);
var addWalletHandler = new Handler(handlerFunc: (
    BuildContext context, Map<String, List<String>> params
    ) {
  return new AddWalletScreen();
});

// router.define(RouteConstants.ROUTE_CATEGORY, handler: null);
var categoryHandler = new Handler(handlerFunc: (
    BuildContext context, Map<String, List<String>> params
    ) {
  return new CategoryScreen();
});

var bancoHandler = new Handler(handlerFunc: (
    BuildContext context, Map<String, List<String>> params
    ) {
  return new BancoScreen();
});

var volatividadeoHandler = new Handler(handlerFunc: (
    BuildContext context, Map<String, List<String>> params
    ) {
  return new VolatividadeScreen();
});
