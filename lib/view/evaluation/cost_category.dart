// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, use_key_in_widget_constructors, prefer_const_constructors
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:smart_factory_analyzer/api/annual_revenue_api.dart';
import 'package:smart_factory_analyzer/controller/create_company_controller.dart';
import 'package:smart_factory_analyzer/core/app_const.dart';
import 'package:smart_factory_analyzer/model/annual_revenue_model.dart';
import 'package:smart_factory_analyzer/view/evaluation/top_kpi.dart';

import 'package:smart_factory_analyzer/view/welcome_page.dart';
import 'package:smart_factory_analyzer/view/widget/loading_page.dart';

import '../../core/app_route.dart';
import '../../core/const.dart';
import '../company_prograss.dart';

class CostCategory extends StatefulWidget {
  @override
  State<CostCategory> createState() => _CostCategoryState();
}

class _CostCategoryState extends State<CostCategory> {
  var loading = false;
  List<String> Informations = [
    "Aftermarket Services / Warranty",
    "Depreciation",
    "Labor",
    "Maintenance & Repair",
    "Raw Materials & Consumables",
    "Rental & Operating Lease",
    "Research & Development",
    "Selling, General & Administrative Expense ('SG&A')",
    "Transportation & Distribution",
    "Utilities"
  ];

  List<TextEditingController> controller =
      List.generate(10, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Visibility(
      replacement: LoadingWidgetForTheApp(),
      visible: !loading,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppConst.backgroundBlueColor,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              'Cost Categories',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 19),
            ),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => CompanyPrograss()),
                );
              },
            ),
          ),
          body: SafeArea(
            child: ListView.builder(
              itemCount: Informations.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 40),
                  child: inputFiled(
                      screenHight: ConstVariable.getHeight(context),
                      screenWidht: ConstVariable.getWidth(context),
                      controller: controller[index],
                      hintText: Informations[index]),
                );
              },
            ),
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
              onPressed: () {
                setState(() {
                  loading = true;
                });
                var sum = 0;

                for (var element in controller) {
                  if (element.text.isEmpty) {
                    Fluttertoast.showToast(
                        backgroundColor: Colors.red,
                        msg: "fill all the input",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  } else {
                    if (int.tryParse(element.text) == null &&
                        int.parse(element.text) > 100) {
                      Fluttertoast.showToast(
                          backgroundColor: Colors.red,
                          msg: "input should be only number and less then 100",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } else {
                      sum += int.parse(element.text);
                    }
                  }
                }
                
                  var value =Provider.of<CreateCompanyController>(context,listen: false).companyId;
                  print(value);
                  AnnualRevenueModel annualRevenueModel = AnnualRevenueModel(
                      assessementRecord: value,
                      aftermarketservices: double.parse(controller[0].text),
                      depreciation: double.parse(controller[1].text),
                      labour: double.parse(controller[2].text),
                      maintenanceandrepair: double.parse(controller[3].text),
                      rawmaterialandConsumable:
                          double.parse(controller[4].text),
                      researchandDevelopment: double.parse(controller[6].text),
                      rentalOperatingLease: double.parse(controller[5].text),
                      sellinggeneralexpenses: double.parse(controller[7].text),
                      transportationandDistribution:
                          double.parse(controller[8].text),
                      utilities: double.parse(controller[9].text));
                  AnnualRevenueApi.addAnnualRevenue(
                          context: context,
                          annualRevenueModel: annualRevenueModel)
                      .then((value) {
                    if ((value['code'] as int >= 200 &&
                        (value['code'] as int < 300))) {
                      setState(() {
                        loading = false;
                      });
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) {
                        return TopKPI();
                      }));
                    } else {
                      setState(() {
                        loading = false;
                      });
                      Fluttertoast.showToast(
                          backgroundColor: Colors.red,
                          msg: 'somthing wrong happend',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  });
                }
              
            ),
          ),
        ),
      ),
    );
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
}
