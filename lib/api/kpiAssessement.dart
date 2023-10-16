import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_factory_analyzer/model/kpiAssesement.dart';

import '../core/app_const.dart';
import '../model/annual_revenue_model.dart';
 // Import your AppConst class or define it with the apiUrl

class KpiAssessementApi {
  static Future<Map<String, Object>> addAssessementApi({
    required BuildContext context,
    required AssessmentModel assessmentModel,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString("token") ?? "";
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
      'Charset': 'utf-8',
    };
    String url = "${AppConst.apiUrl}/kpicategorie/create";
    try {
      //print(annualRevenueModel.toJson());
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(assessmentModel.toJson()),
      );
      final jsonData = json.decode(response.body);
      print(jsonData);
      return {
        'code': response.statusCode,
        'message': jsonData["message"] ?? jsonData['error'],
      };
    } catch (e) {
      print('Error: $e');
      return {'code': 400, "message": e.toString()};
    }
  }
}
