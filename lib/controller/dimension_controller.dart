import 'package:flutter/material.dart';

class DimensionController with ChangeNotifier {
  int questionIndex = 0;
  List<String> dimResponse = [];
  int bandIndex = -1;
  bool loading = false;

  onChangeBandIndex(int value) {
    bandIndex = value;
    notifyListeners();
  }

  restBandIndex() {
    bandIndex = -1;
    notifyListeners();
  }

  addDim(String response) {
    dimResponse.add(response);
    notifyListeners();
  }

  resetDim() {
    dimResponse.clear();
    notifyListeners();
  }

  incrementQuestionIndex() {
    questionIndex++;
    notifyListeners();
  }

  resetQuestionIndex() {
    questionIndex = 0;
    notifyListeners();
  }

  String currentName = "";
  onChangeLoading(bool value) {}
  onChange(String value) {
    currentName = value;
    notifyListeners();
  }
}
