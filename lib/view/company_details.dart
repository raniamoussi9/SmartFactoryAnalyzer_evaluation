import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_factory_analyzer/view/dashboard.dart';

import '../utils/const.dart';
import 'company_details_page_input.dart';
import 'first_form.dart';

class CompanyDetails extends StatefulWidget {
  const CompanyDetails({super.key});

  @override
  State<CompanyDetails> createState() => _CompanyDetailsState();
}

class _CompanyDetailsState extends State<CompanyDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 36, 36, 93),
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
                return const Dashboard();
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
                    button(text: "Company Contacts",  onpress: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return const FirstForm();
                          }));
                        }),
                    button(text: "Scope of Assessment",  onpress: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return const FirstForm();
                          }));
                        }),
                    button(text: "Assessment Dates",  onpress: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return const FirstForm();
                          }));
                        }),
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
          color: ConstVariable.colorCompanyDetails,
          disabledColor: ConstVariable.colorCompanyDetails,
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
