import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_factory_analyzer/core/app_const.dart';

import '../model/industry_group_model.dart';

class DashboardApi {
  

  static Future<List<IndustryGroupModel>>? getIndustryGroup() async {
    
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString("token") ?? "";

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
      'Charset': 'utf-8'
    };

    try {
      final response = await http.get(
          Uri.parse("${AppConst.apiUrl}/indusgroup/list"),
          headers: headers);

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = (json.decode(response.body));
        List<IndustryGroupModel> indusGroupList = [];

        for (var item in jsonData) {
          indusGroupList.add(IndustryGroupModel.fromJson(item));
        }

        return indusGroupList;
      } else {
        // Error response
        return [];
      }
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }
}
