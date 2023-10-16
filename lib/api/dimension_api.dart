import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_factory_analyzer/model/company_model.dart';
import 'package:smart_factory_analyzer/model/dimension_model.dart';
import 'package:http/http.dart' as http;
import '../core/app_const.dart';

class DimensionApi {
  static Future<Map<String, Object>> addDim(
      {required BuildContext context,
      required DimensionModel dimensionModel}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString("token") ?? "";
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
      'Charset': 'utf-8'
    };
    String url = "${AppConst.apiUrl}/dimension/create";
    try {
      final response = await http.post(Uri.parse(url),
          headers: headers, body: jsonEncode(dimensionModel.toJson()));
      /*final jsonData = (json.decode(response.body));
      print(jsonData+"   ............................................");
      print("--------");*/
      return {
        'code': response.statusCode,
      };
    } catch (e) {
      print('Error: $e');
      return {'code': 400};
    }
  }
}
