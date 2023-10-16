import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user.dart';

class LoginControlller with ChangeNotifier {
  User user = User(id: "", userName: "", email: "", password: "",isAdmin: false,phoneNumber: 0);
  Future<void> setUserName(Map<String, dynamic> user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    this.user = User.fromJson(user);
    print(user);
    prefs.setString("user", jsonEncode(user));
    notifyListeners();
  }

  Future<User> getUserName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    user = User.fromJson(jsonDecode(prefs.getString("user")!));
    print(user.userName);
    print("-------");
    notifyListeners();
    return user;
  }
}
