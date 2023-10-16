import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smart_factory_analyzer/api/planning_horizon_api.dart';
import 'package:smart_factory_analyzer/controller/create_company_controller.dart';
import 'package:smart_factory_analyzer/core/const.dart';
import 'package:smart_factory_analyzer/view/dashboard.dart';
import 'package:smart_factory_analyzer/view/evaluation/top_kpi.dart';

import '../../core/app_const.dart';
import '../../model/planning_horizan_model.dart';

class PlanningHorizonPage extends StatefulWidget {
  const PlanningHorizonPage({super.key});

  @override
  State<PlanningHorizonPage> createState() => _PlanningHorizonPageState();
}

class _PlanningHorizonPageState extends State<PlanningHorizonPage> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CreateCompanyController>(context);
    return Scaffold(
      backgroundColor: AppConst.backgroundBlueColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: ConstVariable.getHeight(context) * 0.1,
        elevation: 14,
        title: Text(
          'Planning horizon',
          style: GoogleFonts.poppins(
            fontSize: 15,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20))),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return const DashboardPage();
            }));
          },
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.black,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              loading = true;
            });
            if (provider.indexOfPlanningHorizonPage == -1) {
              Fluttertoast.showToast(
                  backgroundColor: Colors.red,
                  msg: "choose one of the options",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  textColor: Colors.white,
                  fontSize: 16.0);
            } else {
              PlanningHorizonModel planningHorizonModel = PlanningHorizonModel(
                  assessmentRecord: provider.companyId,
                  strategic: provider.indexOfPlanningHorizonPage == 0,
                  tactical: provider.indexOfPlanningHorizonPage == 1,
                  operational: provider.indexOfPlanningHorizonPage == 2);
              PlanningHorizonApi.addAnnualRevenue(
                      context: context,
                      planningHorizonModel: planningHorizonModel)
                  .then((value) {
                if ((value['code'] as int >= 200 &&
                    (value['code'] as int < 300))) {
                  setState(() {
                    loading = false;
                  });
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) {
                    return DashboardPage();
                  }));
                } else {
                  setState(() {
                    loading = false;
                  });
                  Fluttertoast.showToast(
                      backgroundColor: Colors.red,
                      msg: "${value['message']}"??"somthing wrong happend",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      textColor: Colors.white,
                      fontSize: 16.0);
                }
              });
            }
          },
          child: const Icon(
            Icons.done,
            color: Colors.black,
          )),
      body: SafeArea(
          minimum:
              EdgeInsets.only(top: ConstVariable.getHeight(context) * 0.02),
          child: Center(
            child: Column(
              children: [
                ConstVariable.radioElementOfPanning(
                    text: "Strategic",
                    context: context,
                    indexPlanning: provider.indexOfPlanningHorizonPage,
                    index: 0),
                ConstVariable.radioElementOfPanning(
                    text: "Tactical",
                    context: context,
                    indexPlanning: provider.indexOfPlanningHorizonPage,
                    index: 1),
                ConstVariable.radioElementOfPanning(
                    text: "Operational",
                    context: context,
                    indexPlanning: provider.indexOfPlanningHorizonPage,
                    index: 2),
              ],
            ),
          )),
    );
  }
}
