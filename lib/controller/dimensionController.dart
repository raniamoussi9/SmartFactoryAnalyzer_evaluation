import 'package:flutter/material.dart';

class DimensionController with ChangeNotifier {
  var dimensionList = [
    "How does the operations team manage and execute\nthe information flow across all hierarchical levels of\nthe automation pyramid\n(i.e. from entreprise plaaaning level to the field level) ?"
        "How are the resource planning and technical production\nprocesses managed and executed(e.g. Production, Quality,etc.)?",
    "How are the machines in the shop floor managed and\nmonitored\n(e.g. quality performance operating status, etc) ?",
    "How is the qualty data collected and managed ?",
    "How is data collected and analyzed to optimize\noperations processes across the automation\npyramid ? \nPlease Describle the processes and the tools used",
    "How does the supply chain team manage and execute\nthe information flow across the organization and with \nstakeholders along  the values chain \n(e.g. Supply Chain Management, Purchasing etc.)?",
    "How are the entreprise porcesses managed and \nexecuted within the internal stakeholders\n(e.g. Supply Chain Management, Purchasing etc.)?",
    "How are the entreprise processes managed and\nexecuted with the external stakeholders \n(e.g. Distribution, Logistics and Customers)?",
    "How is the supply chain data collected and managed ?",
    "How is data collected and analyzed to optimize the\nentreprise processes \n(i.e Supply Chain Management)? \nPlease describe the processes and the tools used"
  ];
  String currentName = "";
  onChange(String value) {
    currentName = value;
    notifyListeners();
  }
}
