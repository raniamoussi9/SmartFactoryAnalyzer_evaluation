import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smart_factory_analyzer/controller/create_company_controller.dart';
import 'package:smart_factory_analyzer/core/app_route.dart';
import 'package:smart_factory_analyzer/core/const.dart';
import 'package:smart_factory_analyzer/view/company_details_global_page.dart';

import '../core/app_const.dart';

class ScopeOfAssesementPage extends StatelessWidget {
  const ScopeOfAssesementPage({super.key});

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
          'Create Company',
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
              return const CompanyDetailsGlobalPage();
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
            Navigator.pushReplacementNamed(
                context, AppRoute.assessmentDatesPage);
          },
          child: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.black,
          )),
      body: SafeArea(
          minimum:
              EdgeInsets.only(top: ConstVariable.getHeight(context) * 0.02),
          child: Center(
            child: Column(
              children: [
                ConstVariable.radioElement(
                    text: "The entire factory/plant",
                    context: context,
                    isChecked: provider.scopeOfAssesssment,
                    index: 0),
                ConstVariable.radioElement(
                    text: "Section of the factory/plant",
                    context: context,
                    isChecked: !(provider.scopeOfAssesssment),
                    index: 1),
              ],
            ),
          )),
    );
  }
}
