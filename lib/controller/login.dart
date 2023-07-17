import 'package:flutter/material.dart';

class LoginControlller with ChangeNotifier {
  String userName = "";
  void setUserName(String name) {
    userName = name;
    notifyListeners();
  }
}
