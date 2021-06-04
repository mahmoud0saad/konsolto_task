import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter/widgets.dart';
import 'package:konsolto_app/route/router_init.dart';
import 'package:konsolto_app/ui/add_todo/add_to_do_screen.dart';
import 'package:konsolto_app/ui/home/home_screen.dart';

class Routes {
  static List<IRouterProvider> _listRouter = [];

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      debugPrint("debugPrint");
      return Container();
    });


    router.define(HomeScreen.TAG,
        handler: Handler(
            handlerFunc:
                (BuildContext context, Map<String, List<String>> params) =>
                    HomeScreen()));
    router.define(AddToDoScreen.TAG,
        handler: Handler(
            handlerFunc:
                (BuildContext context, Map<String, List<String>> params) =>
                    AddToDoScreen()));



    _listRouter.clear();
    _listRouter.forEach((routerProvider) {
      routerProvider.initRouter(router);
    });
  }
}
