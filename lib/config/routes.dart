/*
 * fluro
 * A Posse Production
 * http://goposse.com
 * Copyright (c) 2018 Posse Productions LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../screens/login_screen.dart';
import './route_handlers.dart';

class RouteConstants {
  static const String ROUTE_LOGIN = "/login";
  static const String ROUTE_SIGN_UP = "/sign_up";
  static const String ROUTE_FORGOT_PASSWORD = "/forgot_password";
  static const String ROUTE_VERIFY_CODE = "/verify_code";
  static const String ROUTE_CREATE_WALLET = "/create_wallet";
  static const String ROUTE_HOME = "/home";
  static const String ROUTE_LIST_WALLET = "/list_wallet";
  static const String ROUTE_INFORMATION = "/information";
  static const String ROUTE_PROFILE_GUEST = "/profile_guest";
  static const String ROUTE_DOCUMENTOS = "/documentos";
  static const String ROUTE_PROFILE_MORE = "/profile_more";
  static const String ROUTE_PROFILE_PREMIUM = "/profile_premium";
  static const String ROUTE_REPORT = "/report";
  static const String ROUTE_SETTINGS_PROFILE = "/settings_profile";
  static const String ROUTE_ADD_TRANSACTION = "/add_transaction";
  static const String ROUTE_SPLASH = "/";
  static const String ROUTE_WALK_THROUGH = "/walk_through";
  static const String ROUTE_ADD_BANK = "/add_bank";
  static const String ROUTE_CHART = "/chart";
  static const String ROUTE_PREMIUM_ACCOUNT = "/premium_account";
  static const String ROUTE_ADD_WALLET = "/add_wallet";
  static const String ROUTE_CATEGORY = "/category";
  static const String ROUTE_ERROR = "/error";
  static const String ROUTE_BANCO = "/banco";
  static const String ROUTE_VOLATIVIDADE = "/volatividade";
}

class Routes {

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return new LoginScreen();
    });

    router.define(RouteConstants.ROUTE_SPLASH, handler: splashHandler);
    router.define(RouteConstants.ROUTE_HOME, handler: homeHandler);
    router.define(RouteConstants.ROUTE_LOGIN, handler: loginHandler);
    router.define(RouteConstants.ROUTE_CREATE_WALLET, handler: createWalletHandler);
    router.define(RouteConstants.ROUTE_SIGN_UP, handler: signUpHandler);
    router.define(RouteConstants.ROUTE_FORGOT_PASSWORD, handler: forgotPasswordHandler);
    router.define(RouteConstants.ROUTE_VERIFY_CODE, handler: verifyCodeHandler);
    router.define(RouteConstants.ROUTE_LIST_WALLET, handler: listWalletHandler);
    router.define(RouteConstants.ROUTE_INFORMATION, handler: informationHandler);
    router.define(RouteConstants.ROUTE_PROFILE_GUEST, handler: profileGuestHandler);
    router.define(RouteConstants.ROUTE_DOCUMENTOS, handler: profileLessHandler);
    router.define(RouteConstants.ROUTE_PROFILE_MORE, handler: profileMoreHandler);
    router.define(RouteConstants.ROUTE_PROFILE_PREMIUM, handler: profilePremiumHandler);
    router.define(RouteConstants.ROUTE_REPORT, handler: reportHandler);
    router.define(RouteConstants.ROUTE_SETTINGS_PROFILE, handler: settingsProfileHandler);
    router.define(RouteConstants.ROUTE_ADD_TRANSACTION, handler: addTransactionHandler);

    router.define(RouteConstants.ROUTE_WALK_THROUGH, handler: walkThroughHandler);
    router.define(RouteConstants.ROUTE_ADD_BANK, handler: addBankHandler);
    router.define(RouteConstants.ROUTE_CHART, handler: chartHandler);
    router.define(RouteConstants.ROUTE_PREMIUM_ACCOUNT, handler: premiumAccountHandler);
    router.define(RouteConstants.ROUTE_ADD_WALLET, handler: addWalletHandler);
    router.define(RouteConstants.ROUTE_CATEGORY, handler: categoryHandler);
    router.define(RouteConstants.ROUTE_BANCO, handler: bancoHandler);
    router.define(RouteConstants.ROUTE_VOLATIVIDADE, handler: volatividadeoHandler);

  }
}