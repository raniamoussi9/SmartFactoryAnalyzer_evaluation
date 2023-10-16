// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, use_key_in_widget_constructors, prefer_const_constructors
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:smart_factory_analyzer/api/annual_revenue_api.dart';
import 'package:smart_factory_analyzer/api/kpiAssessement.dart';
import 'package:smart_factory_analyzer/model/annual_revenue_model.dart';
import 'package:smart_factory_analyzer/model/kpiAssesement.dart';
import 'package:smart_factory_analyzer/view/dashboard.dart';
import 'package:smart_factory_analyzer/view/evaluation/planning_horizon_page.dart';

import 'package:smart_factory_analyzer/view/welcome_page.dart';

import '../../controller/create_company_controller.dart';
import '../../core/const.dart';

class TopKPI extends StatefulWidget {
  @override
  State<TopKPI> createState() => _TopKPIState();
}

class _TopKPIState extends State<TopKPI> {
  var loading = false;
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
    "Planning & Scheduling Effectiveness",
    "Production Flexibility",
    "Workforce Flexibility",
    "Time to Market",
    "Time to Delivery",
  ];

  List<TextEditingController> controller =
      List.generate(14, (index) => TextEditingController());

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
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) {
                return DashboardPage();
              }));
            },
          ),
        ),
        body: ListView.builder(
          itemCount: Informations.length,
          itemBuilder: (context, index) {
            return inputFiled(
                screenHight: ConstVariable.getHeight(context),
                screenWidht: ConstVariable.getWidth(context),
                controller: controller[index],
                hintText: Informations[index]);
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 20)),
                child: Text(
                  'Next',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    loading = true;
                  });
                  var sum = 0;

                  for (var element in controller) {
                    if (!(element.text.isNotEmpty &&
                        (int.tryParse(element.text) != null &&
                            (int.parse(element.text) == 0 ||
                                int.parse(element.text) == 1)))) {
                      Fluttertoast.showToast(
                          backgroundColor: Colors.red,
                          msg: "input should be 0 or 1",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } else {
                      sum += int.parse(element.text);
                    }
                  }
                  if (sum == 5) {
                    var value = Provider.of<CreateCompanyController>(context,
                            listen: false)
                        .companyId;
                      print(controller[13].text);
                    AssessmentModel assessmentModel = AssessmentModel(
                        assessmentRecord: value,
                        assetandEquipmentEfficiency:
                            int.parse(controller[0].text),
                        workforceEfficiency: int.parse(controller[1].text),
                        utilitiesEfficiency: int.parse(controller[2].text),
                        inventoryEfficiency: int.parse(controller[3].text),
                        materialsEfficiency: int.parse(controller[4].text),
                        processquality: int.parse(controller[5].text),
                        productquality: int.parse(controller[6].text),
                        safety: int.parse(controller[7].text),
                        security: int.parse(controller[8].text),
                        planningandschedulingEffectiveness:
                            int.parse(controller[9].text),
                        productionFlexibility: int.parse(controller[10].text),
                        workforceFlexibility: int.parse(controller[11].text),
                        timetomarket: int.parse(controller[12].text),
                        timetodelivery: int.parse(controller[13].text));
                    print(assessmentModel);
                    KpiAssessementApi.addAssessementApi(
                            context: context, assessmentModel: assessmentModel)
                        .then((value) {
                      if ((value['code'] as int >= 200 &&
                          (value['code'] as int < 300))) {
                        setState(() {
                          loading = false;
                        });
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) {
                          return PlanningHorizonPage();
                        }));
                      } else {
                        setState(() {
                          loading = false;
                        });
                        Fluttertoast.showToast(
                            backgroundColor: Colors.red,
                            msg: 'you should pick 5 element',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                    });
                  }
                })),
      ),
    );
  }
}

Center inputFiled(
    {required double screenHight,
    required double screenWidht,
    required String hintText,
    required TextEditingController controller}) {
  return Center(
    child: Padding(
        padding: EdgeInsets.only(
            top: screenHight * 0.015,
            left: screenWidht * 0.02,
            right: screenWidht * 0.02),
        child: TextField(
          keyboardType: TextInputType.number,
          controller: controller,
          onChanged: (value) {
            if (kDebugMode) {
              print("The value entered is : $value");
            }
          },
          cursorColor: const Color.fromARGB(255, 255, 255, 255),
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintStyle: const TextStyle(
              color: Color.fromARGB(146, 255, 255, 255),
              fontWeight: FontWeight.w300,
              fontSize: 14,
            ),
            hintText: hintText,
            filled: true,
            fillColor: const Color.fromARGB(255, 32, 32, 69),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        )),
  );
}
