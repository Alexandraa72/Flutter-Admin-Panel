import 'package:admin/screens/auth/authentication.dart';
import 'package:admin/screens/main/main_screen.dart';
import 'package:admin/screens/main/transaction.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();
  static Handler _authHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          AuthenticationPage());
  static Handler _homeHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          MainScreen());
  static Handler _homeHandler2 = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          Transaction());

  static void setupRouter() {
    router.define('/', handler: _authHandler);
    router.define('/dashboard',
        handler: _homeHandler, transitionType: TransitionType.fadeIn);
    router.define('/transaction',
        handler: _homeHandler2, transitionType: TransitionType.fadeIn);
  }
}
