// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, use_key_in_widget_constructors, prefer_const_constructors
import 'package:flutter/material.dart';

import 'package:smart_factory_analyzer/view/welcome_page.dart';

import '../../core/const.dart';

class TopKPI extends StatelessWidget {
  List<String> Informations = [
    "Asset & Equipment Efficiency",
    "Workforce Efficiency",
    "Utilities Efficiency",
    "Inventory Efficiency",
    "Material Efficiency",
    "Process Quality",
    "Product Quality",
    "Safety",
    "Security",
    "Production Flexibility",
    "Workforce Flexibility",
    "Time to Market",
    "Time to Delivery",
    "Planning & Scheduling Effectiveness"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: myColor,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Top KPI Categories',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 19),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: ListView.builder(
          itemCount: Informations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 40),
              child: PercentageInputField(labelText: Informations[index]),
            );
          },
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 150, vertical: 20),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: myColor3,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20)),
            child: Text(
              'Next',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}

