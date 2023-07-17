// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../welcome_page.dart';

class Planning extends StatefulWidget {
  const Planning({super.key});

  @override
  State<Planning> createState() => _PlanningState();
}

class _PlanningState extends State<Planning> {
  String? selectedPlanningHorizon;

  String? selectedIndustryGroup;

  final List<String> planningHorizons = [
    "Strategic",
    "Tactical",
    "Operational"
  ];

  final List<String> industryGroups = [
    'Transportation',
    'Chemical',
    'Electronics',
    'Energy',
    'Metal & Mining',
    'Advanced Manufacturing',
    'Pharmaceuticals & HealthCare',
    'Paper',
    'Utilities',
    'Textile, Leather, Apparels',
    'Fast Moving Consumer Goods',
    'General Manufacturing'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: myColor,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              // Action à effectuer lorsqu'on appuie sur le bouton arrow back
              // Par exemple, pour retourner à l'écran précédent :
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Planning Horizon\nProximity to Best-in-Class',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                  Text(
                    'Planning Horizon',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: myColor3),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.height * 0.13),
                    child: DropdownButton<String>(
                      value: selectedPlanningHorizon,
                      hint: Text(
                        'Select the method',
                        style: TextStyle(color: Colors.grey),
                      ),
                      items: planningHorizons.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(color: Colors.grey),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? selectedValue) {
                        setState(() {
                          selectedPlanningHorizon = selectedValue;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                  Text(
                    'Proximity to Best-in-Class',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: myColor3),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.height * 0.13),
                    child: DropdownButton<String>(
                      value: selectedIndustryGroup,
                      hint: Text(
                        'Select the Industry Group',
                        style: TextStyle(color: Colors.grey),
                      ),
                      items: industryGroups.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(color: Colors.grey),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? selectedValue) {
                        setState(() {
                          selectedIndustryGroup = selectedValue;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.2),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: myColor3,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.2,
                      vertical: 20),
                ),
                child: Text(
                  'Next',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.height * 0.02),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
