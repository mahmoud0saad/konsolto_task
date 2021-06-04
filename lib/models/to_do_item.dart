
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ToDoItem {
  ToDoItem({
    this.title,
    this.date,
    this.body,
  });

  String title;
  String date;
  String body;

  factory ToDoItem.fromJson(String str) => ToDoItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ToDoItem.fromMap(Map<String, dynamic> json) => ToDoItem(
    title: json["title"] == null ? null : json["title"],
    date: json["date"] == null ? null : json["date"],
    body: json["body"] == null ? null : json["body"],
  );

  Map<String, dynamic> toMap() => {
    "title": title == null ? null : title,
    "date": date == null ? null : date,
    "body": body == null ? null : body,
  };

  factory ToDoItem.fromDocumentSnapshot( DocumentSnapshot document) =>ToDoItem.fromMap(document.data() as Map<String, dynamic>);

}
