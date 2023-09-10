import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:smart_factory_analyzer/controller/create_company_controller.dart';
import '../controller/login.dart';
import '../core/app_const.dart';
import '../model/company_contact_model.dart';
import '../model/company_model.dart';
import '../model/user.dart';

class CompanyApi {
  static Future<Map<String, Object>> addCompany(
      {required BuildContext context,
      required CompanyModel companyModel}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString("token") ?? "";
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
      'Charset': 'utf-8'
    };
    String url = "${AppConst.apiUrl}/company/create";
    try {
      final response = await http.post(Uri.parse(url),
          headers: headers, body: jsonEncode(companyModel.toJson()));
      final jsonData = (json.decode(response.body));
      print(jsonData);
      return {
        'code': response.statusCode,
        'message': jsonData["message"],
        'assessmentRecord': jsonData["assessmentRecord"]
      };
    } catch (e) {
      print('Error: $e');
      return {'code': 400, "message": e, "assessmentRecord": ""};
    }
  }

  static Future<Map<String, Object>> addCompanyContact(
      {required BuildContext context,
      required CompanyContactModel companyContactModel}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString("token") ?? "";
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
      'Charset': 'utf-8'
    };
    String url = "${AppConst.apiUrl}/contact/create";
    try {
      final response = await http.post(Uri.parse(url),
          headers: headers, body: jsonEncode(companyContactModel.toJson()));
      print(response.body);
      return {'code': response.statusCode, 'message': response.body};
    } catch (e) {
      print('Error: $e...................................');
      return {'code': 400, "message": e};
    }
  }

  static Future<CompanyModel?> getCompany(
      {required BuildContext context}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final CreateCompanyController provider =
        Provider.of<CreateCompanyController>(context, listen: false);
    final String token = prefs.getString("token") ?? "";

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
      'Charset': 'utf-8'
    };
    String url = "${AppConst.apiUrl}/company/element/${provider.companyId}";

    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      if (response.statusCode == 200) {
        final dynamic jsonData = (json.decode(response.body));
        return CompanyModel.fromJson(jsonData);
      } else {
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  static Future<List<CompanyModel>>? getCompanies(
      {required BuildContext context, required String industryId}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final LoginControlller provider =
        Provider.of<LoginControlller>(context, listen: false);
    final String token = prefs.getString("token") ?? "";

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
      'Charset': 'utf-8'
    };
    String url = "";

    try {
      User info = await provider.getUserName();
      if (industryId.isNotEmpty) {
        url =
            "${AppConst.apiUrl}/company/list?userId=${info.id}&indusGroup=$industryId";
      } else {
        url = "${AppConst.apiUrl}/company/list?userId=${info.id}";
      }
      final response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = (json.decode(response.body));
        List<CompanyModel> companyList = [];
        for (var item in jsonData) {
          companyList.add(CompanyModel.fromJson(item));
        }
        return companyList;
      } else {
        // Error response
        return [];
      }
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }

  static Future<List<CompanyContactModel>> getCompanyContacts(
      {required BuildContext context}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final CreateCompanyController provider =
        Provider.of<CreateCompanyController>(context, listen: false);
    final String token = prefs.getString("token") ?? "";

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
      'Charset': 'utf-8'
    };
    String url =
        "${AppConst.apiUrl}/contact/list?assessmentRecord=${provider.companyId}";

    try {
      final response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = (json.decode(response.body));
        List<CompanyContactModel> companyContactList = [];
        for (var item in jsonData) {
          companyContactList.add(CompanyContactModel.fromJson(item));
        }
        return companyContactList;
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
