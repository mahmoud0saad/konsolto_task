
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:konsolto_app/base/presenter/base_presenter.dart';

import 'home_screen.dart';

class HomePresenter extends BasePresenter<HomeScreenState> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Stream<QuerySnapshot> getToDoList() {
    return  users.snapshots();
  }

}
