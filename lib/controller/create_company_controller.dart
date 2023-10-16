import 'package:flutter/material.dart';
import 'package:smart_factory_analyzer/model/industry_group_model.dart';

class CreateCompanyController with ChangeNotifier {
  int indexCompanyDetail = 0;
  String companyId = "";
  String companyName = "";
  double companyAdvencement = 0;
  int companyIndex = 0;
  bool scopeOfAssesssment = false;
  int indexOfPlanningHorizonPage = -1;
  bool loading = false;

  DateTime onboardingCall = DateTime.now();
  DateTime dateOfEvaluation = DateTime.now();
  DateTime dateOfDebrief = DateTime.now();
  List<IndustryGroupModel> listOfIndustryGroup = [];
  late IndustryGroupModel industryGroupModel;

  void onChange(bool value) {
    loading = value;
    notifyListeners();
  }

  void onChangeDate(int index, DateTime value) {
    switch (index) {
      case 0:
        onboardingCall = value;
        break;
      case 1:
        dateOfEvaluation = value;
        break;

      default:
        dateOfDebrief = value;
        break;
    }
    notifyListeners();
  }

  void onChangeCompanyIndex(int value) {
    companyIndex = value;
    notifyListeners();
  }

  void onChangeCompanyId(String value, String value1) {
    companyId = value;
    companyName = value1;
    notifyListeners();
  }

  void onChangeCompanyAdvancement({double? value}) {
    if (value != null) {
      companyAdvencement = value;
    } else {
      companyAdvencement += 6.25;
    }

    notifyListeners();
  }

  void resetCompanyAdvancement() {
    companyAdvencement = 0;
    notifyListeners();
  }

  void setListOfIndustryGroup(List<IndustryGroupModel> list) {
    listOfIndustryGroup = list;
    industryGroupModel = list[1];
    notifyListeners();
  }

  void onChangeScope(int index) {
    if (index == 0) {
      scopeOfAssesssment = true;
    } else {
      scopeOfAssesssment = false;
    }
    notifyListeners();
  }

  void onChangePlannigHorizon(int index) {
    indexOfPlanningHorizonPage = index;
    notifyListeners();
  }

  void onChangeIndustryGroup(IndustryGroupModel value) {
    industryGroupModel = value;
    notifyListeners();
  }

  void resetIndexCompanyDetail() {
    indexCompanyDetail = 0;
    notifyListeners();
  }

  void onChangeIndexCompanyDetail() {
    if (indexCompanyDetail <= 2) {
      indexCompanyDetail++;
    }
    notifyListeners();
  }
}
