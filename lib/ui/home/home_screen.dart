import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:konsolto_app/CommonUtils/size_config.dart';
import 'package:konsolto_app/base/view/base_state.dart';
import 'package:konsolto_app/generated/l10n.dart';
import 'package:konsolto_app/models/to_do_item.dart';
import 'package:konsolto_app/res/colors.dart';
import 'package:konsolto_app/ui/add_todo/add_to_do_screen.dart';
import 'package:konsolto_app/widgets/CircularProgress.dart';
import 'package:provider/provider.dart';

import 'home_presenter.dart';
import 'home_provider.dart';

class HomeScreen extends StatefulWidget {
  static bool isArabic = true;
  static const String TAG = "/HomeScreen";

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends BaseState<HomeScreen, HomePresenter>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  HomeProvider<dynamic> provider = HomeProvider<dynamic>();

  HomeProvider<dynamic> countriesProvider =
      HomeProvider<dynamic>();

  double opacity = 0.0;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    FirebaseFirestore.instance.settings = Settings(persistenceEnabled: true);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(" mano  width is ${SizeConfig.screenWidth}");

    super.build(context);
    return ChangeNotifierProvider<HomeProvider<dynamic>>(
      create: (_) => provider,
      child: Material(
        child: SafeArea(
          child: Scaffold(
              appBar: buildAppBar(context),
              body: buildBodyOfToDoList(),
              floatingActionButton: buildFloatingActionButton(context)),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: MColors.primary_color,
      title: Text(S.of(context).todoListApp),
      centerTitle: true,
    );
  }

  FloatingActionButton buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
        elevation: 0.0,
        child: new Icon(Icons.add),
        backgroundColor: new Color(0xFFE57373),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddToDoScreen()));
        });
  }

  StreamBuilder<QuerySnapshot<Object>> buildBodyOfToDoList() {
    return StreamBuilder<QuerySnapshot>(
      stream: mPresenter.getToDoList(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data.docs;
          return buildToDoLIst(snapshot);
        }

        return CircularProgress(color: MColors.primary_color,);
      },
    );
  }

  Container buildToDoLIst(AsyncSnapshot<QuerySnapshot<Object>> snapshot) {
    return Container(
      child: ListView(
        children: snapshot.data.docs.map((DocumentSnapshot document) {
          print("mano ${document.data().toString()} ");
          final data = document.data() as Map<String, dynamic>; // Change the value type to `String`
          print("mano ${data.toString()} ");

          return ToDoItemWidget(toDoItem: ToDoItem.fromDocumentSnapshot(document),);
        }).toList(),
      ),
    );
  }

  @override
  HomePresenter createPresenter() {
    return HomePresenter();
  }

  @override
  bool get wantKeepAlive => true;

  bool checkPlatformIos() {
    return Platform.isIOS;
  }
}

class ToDoItemWidget extends StatelessWidget {
    ToDoItemWidget({
    Key key,
    this.toDoItem
  }) : super(key: key);

  ToDoItem  toDoItem;
  @override
  Widget build(BuildContext context) {
    return new ListTile(
      title:  Text(toDoItem.title),
      subtitle:  Text(toDoItem.body),
      trailing:  Text(toDoItem.date),
    );
  }
}
