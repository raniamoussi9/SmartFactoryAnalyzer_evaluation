import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_factory_analyzer/api/company_api.dart';
import 'package:smart_factory_analyzer/core/app_const.dart';
import 'package:smart_factory_analyzer/core/const.dart';

import 'company_prograss.dart';
import 'dashboard.dart';

class ShowDetailsCompanyPage extends StatefulWidget {
  const ShowDetailsCompanyPage({super.key});

  @override
  State<ShowDetailsCompanyPage> createState() => _ShowDetailsCompanyPageState();
}

class _ShowDetailsCompanyPageState extends State<ShowDetailsCompanyPage> {
  late TextEditingController _companyNameController;
  late TextEditingController _addressController;
  late TextEditingController _cityController;
  late TextEditingController _assessmentRecordController;
  late TextEditingController _industryGroupController;
  late TextEditingController _companyGroupController;
  late TextEditingController _currencyController;
  late TextEditingController _annualController;
  late TextEditingController _amountController;
  late TextEditingController _employmentController;
  @override
  void initState() {
    _companyNameController = TextEditingController();
    _addressController = TextEditingController();
    _cityController = TextEditingController();
    _assessmentRecordController = TextEditingController();
    _industryGroupController = TextEditingController();
    _companyGroupController = TextEditingController();
    _currencyController = TextEditingController();
    _annualController = TextEditingController();
    _amountController = TextEditingController();
    _employmentController = TextEditingController();
    CompanyApi.getCompany(context: context).then((value) {
      if (value != null) {
        _companyNameController.text = value.companyName;
        _addressController.text = value.address;
        _cityController.text = value.address;
        _assessmentRecordController.text = value.assessmentRecord;
        _industryGroupController.text = value.indusGroupId;
        _companyGroupController.text = value.companyName;
        _annualController.text = value.bern;
        _employmentController.text = value.size.toString();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppConst.backgroundBlueColor,
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: ConstVariable.getHeight(context) * 0.09,
          elevation: 14,
          centerTitle: true,
          title: Text(
            'Details',
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
                return CompanyPrograss(
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
        body: SingleChildScrollView(
          child: Column(children: [
            ConstVariable.inputFiled(
                context: context,
                controller: _companyNameController,
                hintText: "Company Name "),
            ConstVariable.inputFiled(
                context: context,
                controller: _assessmentRecordController,
                hintText: "Assessement Record"),
            ConstVariable.inputFiled(
                context: context,
                controller: _addressController,
                hintText: "Address"),
            ConstVariable.inputFiled(
                context: context,
                controller: _cityController,
                hintText: "City"),
            ConstVariable.inputFiled(
                context: context,
                controller: _industryGroupController,
                hintText: "Industry group"),
            ConstVariable.inputFiled(
                context: context,
                controller: _companyGroupController,
                hintText: "Company category"),
            ConstVariable.inputFiled(
                context: context,
                controller: _currencyController,
                hintText: "currency"),
            ConstVariable.inputFiled(
                context: context,
                controller: _annualController,
                hintText: "Annual manufacturing output"),
            ConstVariable.inputFiled(
                context: context,
                controller: _amountController,
                hintText: "Amout of fund"),
            ConstVariable.inputFiled(
                context: context,
                controller: _employmentController,
                hintText: "Employment size"),
            SizedBox(
              height: ConstVariable.getHeight(context) * 0.2,
            ),
          ]),
        ));
  }
}
