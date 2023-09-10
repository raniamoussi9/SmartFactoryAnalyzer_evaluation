import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_factory_analyzer/controller/login.dart';
import 'package:smart_factory_analyzer/core/app_const.dart';
import 'package:smart_factory_analyzer/core/app_route.dart';
import 'package:http/http.dart' as http;

class AuthApi {
  static Future<void> register(String username, String password, String name,
      BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final LoginControlller provider =
        Provider.of<LoginControlller>(context, listen: false);

    final body =
        json.encode({"email": username, "password": password, name: "name"});
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    try {
      var res = await http.post(Uri.parse("${AppConst.apiUrl}/auth/register"),
          body: body, headers: headers);

      print(res.body);
      if (res.statusCode == 200) {
        //ok
        prefs.setBool('isConnected', true).then((value) {
          final body = jsonDecode(res.body);
          provider.setUserName(body["data"]);
          Navigator.pushReplacementNamed(context, AppRoute.dashBoardScreen);
        });
      } else if (res.statusCode == 401) {
        Fluttertoast.showToast(
            backgroundColor: Colors.red,
            msg: 'Invalid credentials!',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            backgroundColor: Colors.red,
            msg: 'Login failed!',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {
      debugPrint('Error signing in:');
      Fluttertoast.showToast(
          backgroundColor: Colors.red,
          msg: 'Login failed!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  static Future<void> signIn(
      String username, String password, BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final LoginControlller provider =
        Provider.of<LoginControlller>(context, listen: false);

    final body = json.encode({"email": username, "password": password});
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    try {
      var res = await http.post(Uri.parse("${AppConst.apiUrl}/auth/login"),
          body: body, headers: headers);

      print(res.body);
      if (res.statusCode == 200) {
        //ok
        prefs.setBool('isConnected', true).then((value) {
          final body = jsonDecode(res.body);
          print(body["data"].runtimeType);
          prefs.setString("token", body['token']);
          provider.setUserName(body["data"]);
          Navigator.pushReplacementNamed(context, AppRoute.dashBoardScreen);
        });
      } else if (res.statusCode == 401) {
        Fluttertoast.showToast(
            backgroundColor: Colors.red,
            msg: 'Invalid credentials!',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            backgroundColor: Colors.red,
            msg: 'Login failed!',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {
      debugPrint('Error signing in:');
      Fluttertoast.showToast(
          backgroundColor: Colors.red,
          msg: 'Login failed!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
