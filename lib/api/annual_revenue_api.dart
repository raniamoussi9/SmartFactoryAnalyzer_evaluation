import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/app_const.dart';
import '../model/annual_revenue_model.dart';
import 'package:http/http.dart' as http;

class AnnualRevenueApi {
  static Future<Map<String, Object>> addAnnualRevenue(
      {required BuildContext context,
      required AnnualRevenueModel annualRevenueModel}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString("token") ?? "";
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
      'Charset': 'utf-8'
    };
    String url = "${AppConst.apiUrl}/annualrevenue/create";
    try {
      final response = await http.post(Uri.parse(url),
          headers: headers, body: jsonEncode(annualRevenueModel.toJson()));
      final jsonData = (json.decode(response.body));
      print(jsonData);
      return {
        'code': response.statusCode,
        'message': jsonData["message"] ?? jsonData['error'],
      };
    } catch (e) {
      print('Error: $e');
      return {'code': 400, "message": e};
    }
  }
}
