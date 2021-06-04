import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:konsolto_app/base/presenter/base_presenter.dart';

import 'add_to_do_screen.dart';

class AddToDoPresenter extends BasePresenter<AddToDoScreenState> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  void addToDo() {
    if (!view.formKey.currentState.validate())
      return;
    else {

      users
          .add({
            'date':
                "${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}",
            'body': bodyController.text,
            'title': titleController.text
          })
          .then((value) => print("mano add done  $value"))
          .catchError((error) => print("mano error $error"))
          .whenComplete(() => print("mano error whenComplete"));

      view.goBack();
    }
  }
}
