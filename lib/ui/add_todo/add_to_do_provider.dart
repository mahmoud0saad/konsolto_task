import 'dart:convert';

import 'package:konsolto_app/base/provider/base_provider.dart';
 import 'package:shared_preferences/shared_preferences.dart';

class AddToDoProvider<T> extends BaseProvider<T> {
  SharedPreferences sharedPreferences;

}
