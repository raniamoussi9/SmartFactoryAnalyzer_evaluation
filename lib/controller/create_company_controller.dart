import 'package:flutter/material.dart';
import 'package:smart_factory_analyzer/model/industry_group_model.dart';

class CreateCompanyController with ChangeNotifier {
  int indexCompanyDetail = 0;
  String companyId = "";
  String companyName = "";

  bool loading = false;
  List<IndustryGroupModel> listOfIndustryGroup = [];
  late IndustryGroupModel industryGroupModel;

  void onChange(bool value) {
    loading = value;
    notifyListeners();
  }

  void onChangeCompanyId(String value, String value1) {
    companyId = value;
    companyName = value1;
    notifyListeners();
  }

  void setListOfIndustryGroup(List<IndustryGroupModel> list) {
    listOfIndustryGroup = list;
    industryGroupModel = list[1];
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
