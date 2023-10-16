import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smart_factory_analyzer/controller/create_company_controller.dart';
import 'package:smart_factory_analyzer/core/const.dart';
import 'package:smart_factory_analyzer/view/company_details_global_page.dart';
import 'package:smart_factory_analyzer/view/dashboard.dart';

import '../core/app_const.dart';

class AssessmentDatesPage extends StatelessWidget {
  const AssessmentDatesPage({super.key});

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
          'Assessment Dates',
          style: GoogleFonts.poppins(
            fontSize: 18,
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
              return const CompanyDetailsGlobalPage();
            }));
          },
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.black,
            size: 26,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
              return const DashboardPage();
            }));
          },
          child: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.black,
          )),
      body: SafeArea(
          minimum:
              EdgeInsets.only(top: ConstVariable.getHeight(context) * 0.05),
          child: Center(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 20),
                  child: const Text(
                    "Date of Onboarding Call",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                ConstVariable.dateChoose(
                    index: 0,
                    time: Provider.of<CreateCompanyController>(context)
                        .onboardingCall,
                    context: context),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 20),
                  child: const Text(
                    "Date Of Evaluation",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                ConstVariable.dateChoose(
                    index: 1,
                    time: Provider.of<CreateCompanyController>(context)
                        .dateOfEvaluation,
                    context: context),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 20),
                  child: const Text(
                    "Date of Debrief",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                ConstVariable.dateChoose(
                    index: 2,
                    time: Provider.of<CreateCompanyController>(context)
                        .dateOfDebrief,
                    context: context),
              ],
            ),
          )),
    );
  }
}
