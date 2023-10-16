import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smart_factory_analyzer/controller/create_company_controller.dart';
import 'package:smart_factory_analyzer/core/app_route.dart';
import 'package:smart_factory_analyzer/view/company_assessment_dates.dart';
import 'package:smart_factory_analyzer/view/company_details_global_page.dart';
import 'package:smart_factory_analyzer/view/dashboard.dart';

import '../core/app_const.dart';
import 'company_contact_page.dart';
import 'company_details_page_input.dart';
import 'company_scope_assessment.dart';

class CompanyGlobalPage extends StatefulWidget {
  const CompanyGlobalPage({super.key});

  @override
  State<CompanyGlobalPage> createState() => _CompanyGlobalPageState();
}

class _CompanyGlobalPageState extends State<CompanyGlobalPage> {
  @override
  Widget build(BuildContext context) {
    CreateCompanyController provider =
        Provider.of<CreateCompanyController>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppConst.backgroundBlueColor,
          toolbarHeight: 138,
          elevation: 14,
          title: Text(
            'Select Project',
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20))),
          leading: IconButton(
            onPressed: () {
              provider.onChangeCompanyId("", "");
              provider.resetCompanyAdvancement();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return const DashboardPage();
              }));
            },
            icon: const Icon(Icons.chevron_left),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  alignment: Alignment.topCenter,
                  child: Column(children: [
                    button(
                        text: "Assessment",
                        onpress: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return const CompanyDetailsGlobalPage();
                          }));
                        }),
                    button(text: "Formation", onpress: () {}),
                    button(text: "Cdc", onpress: () {}),
                    button(text: "Roadmap", onpress: () {}),
                    button(text: "Implementaion", onpress: () {}),
                  ]))
            ],
          ),
        ));
  }

  Container button({required String text, required Function() onpress}) {
    return Container(
      padding: const EdgeInsets.only(top: 18, left: 26, right: 26),
      child: SizedBox(
        height: 65,
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          color: AppConst.colorCompanyDetails,
          disabledColor: AppConst.colorCompanyDetails,
          onPressed: onpress,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(text,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  )),
              const Icon(
                Icons.chevron_right,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
