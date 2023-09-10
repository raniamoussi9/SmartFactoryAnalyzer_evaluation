import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_factory_analyzer/api/company_api.dart';
import 'package:smart_factory_analyzer/core/app_const.dart';
import 'package:smart_factory_analyzer/core/app_route.dart';
import 'package:smart_factory_analyzer/model/company_contact_model.dart';
import 'package:smart_factory_analyzer/view/widget/contact_company_button.dart';
import 'package:smart_factory_analyzer/view/widget/loading_page.dart';

import '../core/const.dart';
import 'company_prograss.dart';

class ShowContactCompany extends StatefulWidget {
  const ShowContactCompany({super.key});

  @override
  State<ShowContactCompany> createState() => _ShowContactCompanyState();
}

class _ShowContactCompanyState extends State<ShowContactCompany> {
  List<CompanyContactModel> contacts = [];
  bool loading = false;
  @override
  void initState() {
    setState(() {
      loading = true;
    });
    CompanyApi.getCompanyContacts(context: context).then((value) {
      setState(() {
        contacts = value;
        loading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !loading,
      replacement: const LoadingWidgetForTheApp(),
      child: Scaffold(
        backgroundColor: AppConst.backgroundBlueColor,
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: ConstVariable.getHeight(context) * 0.09,
          elevation: 14,
          centerTitle: true,
          title: Text(
            'Contacts',
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.bold,
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
                return const CompanyPrograss(
                  progress: 0,
                  name: "",
                );
              }));
            },
            icon: const Icon(
              Icons.chevron_left,
              color: Colors.black,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppConst.colorCompanyDetails,
            child: const Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(
                  context, AppRoute.companyContactPage);
            }),
        body: SafeArea(
            child: Column(
          children: [
            const Text(""),
            SizedBox(
              height: ConstVariable.getHeight(context) * 0.8,
              width: ConstVariable.getWidth(context),
              child: Visibility(
                visible: contacts.isNotEmpty,
                replacement: const Center(
                  child: Text(
                    "empty list",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                child: ListView.builder(
                    itemCount: contacts.length,
                    itemBuilder: (context, index) {
                      return ContactCompanyButton(
                        companyContactModel: contacts[index],
                      );
                    }),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
