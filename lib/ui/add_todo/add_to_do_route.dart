import 'package:fluro/fluro.dart';
import 'package:konsolto_app/route/router_init.dart';

import 'add_to_do_screen.dart';

class AddToDoRouter implements IRouterProvider {
  static String addToDoPage = AddToDoScreen.TAG;

  @override
  void initRouter(FluroRouter router) {
    router.define(addToDoPage,
        handler: Handler(handlerFunc: (_, params) => AddToDoScreen()));
  }
}
