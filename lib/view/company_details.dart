import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smart_factory_analyzer/controller/create_company_controller.dart';
import 'package:smart_factory_analyzer/core/app_route.dart';
import 'package:smart_factory_analyzer/view/dashboard.dart';

import '../core/app_const.dart';
import '../core/const.dart';
import 'company_details_page_input.dart';
import 'company_contact_page.dart';

class CompanyDetailsGlobalPage extends StatefulWidget {
  const CompanyDetailsGlobalPage({super.key});

  @override
  State<CompanyDetailsGlobalPage> createState() =>
      _CompanyDetailsGlobalPageState();
}

class _CompanyDetailsGlobalPageState extends State<CompanyDetailsGlobalPage> {
  @override
  Widget build(BuildContext context) {
    CreateCompanyController provider = Provider.of<CreateCompanyController>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppConst.backgroundBlueColor,
          toolbarHeight: 138,
          elevation: 14,
          title: Center(
              child: Text(
            'Create Company',
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          )),
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
                        text: "Company Details",
                        onpress: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return const CompanyDetailsPageInput();
                          }));
                        }),
                    button(text: "Company Contacts", onpress: () {
                      if(provider.companyId.isNotEmpty){
                        Navigator.pushNamed(context,AppRoute.companyContactPage);
                      }else{
                        Fluttertoast.showToast(
                            backgroundColor: Colors.red,
                            msg: 'fill all the input',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                    }),
                    /*button(
                        text: "Scope of Assessment",
                        onpress: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return const CompanyContactPage();
                          }));
                        }),
                    button(
                        text: "Assessment Dates",
                        onpress: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return const CompanyContactPage();
                          }));
                        }),*/
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
