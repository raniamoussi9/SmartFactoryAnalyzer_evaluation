import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:smart_factory_analyzer/core/app_const.dart';
import 'package:smart_factory_analyzer/model/company_contact_model.dart';
import 'package:smart_factory_analyzer/view/company_details_global_page.dart';
import 'package:smart_factory_analyzer/view/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_factory_analyzer/view/widget/loading_page.dart';

import '../api/company_api.dart';
import '../controller/create_company_controller.dart';
import '../core/app_route.dart';
import '../core/const.dart';

class CompanyContactPage extends StatefulWidget {
  const CompanyContactPage({super.key});

  @override
  State<CompanyContactPage> createState() => _CompanyContactPageState();
}

class _CompanyContactPageState extends State<CompanyContactPage> {
  final TextEditingController _designationController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final double screenHight = MediaQuery.of(context).size.height;
    final double screenWidht = MediaQuery.of(context).size.width;
    CreateCompanyController provider =
        Provider.of<CreateCompanyController>(context);
    return Visibility(
      replacement: LoadingWidgetForTheApp(),
      visible: !provider.loading,
      child: Scaffold(
        backgroundColor: AppConst.backgroundBlueColor,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          toolbarHeight: screenHight * 0.15,
          elevation: 14,
          title: Text(
            'Company Contacts',
            style: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Colors.black,
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                  child: Padding(
                padding: const EdgeInsets.only(top: 35),
                child: Text(
                  'Please fill in the form to continue',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              )),
               ConstVariable.inputFiled(
                 context: context,
                  controller: _designationController,
                  hintText: "Designation"),
               ConstVariable.inputFiled(
                 context: context,
                  controller: _firstNameController,
                  hintText: "First Name"),
               ConstVariable.inputFiled(
                 context: context,
                  controller: _lastNameController,
                  hintText: "Last Name"),
               ConstVariable.inputFiled(
                 context: context,
                  controller: _titleController,
                  hintText: "Title"),
               ConstVariable.inputFiled(
                 context: context,
                  controller: _emailController,
                  hintText: "Email"),
              ConstVariable.inputFiled(
                isTHereNext: false,
                 context: context,
                  controller: _phoneNumberController,
                  hintText: "phone Number"),
              SizedBox(
                height: screenHight * 0.05,
              ),
              GestureDetector(
                onTap: () {
                  CreateCompanyController provider =
                      Provider.of<CreateCompanyController>(context,
                          listen: false);
                  if (_designationController.text.isNotEmpty &&
                      _firstNameController.text.isNotEmpty &&
                      _emailController.text.isNotEmpty &&
                      _phoneNumberController.text.isNotEmpty &&
                      _titleController.text.isNotEmpty) {
                    var companyContactModel = CompanyContactModel(
                        companyName: provider.companyName,
                        idCompany: provider.companyId,
                        title: _titleController.text,
                        firstName: _firstNameController.text,
                        lastName: _lastNameController.text,
                        designation: _designationController.text,
                        mobileNumber:
                            int.tryParse(_phoneNumberController.text) ?? 0000,
                        email: _emailController.text);

                    provider.onChange(true);
                    CompanyApi.addCompanyContact(
                            context: context,
                            companyContactModel: companyContactModel)
                        .then((value) {
                      provider.onChange(false);
                      if ((value['code'] as int >= 200 &&
                          (value['code'] as int < 300))) {
                        Navigator.pushReplacementNamed(context, AppRoute.scopeOfAssessment);
                      } else {
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
                  } else {
                    Fluttertoast.showToast(
                        backgroundColor: Colors.red,
                        msg: 'fill all the input',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                },
                child: Container(
                  width: ConstVariable.getWidth(context) * 0.8,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      color: AppConst.blueColorOfButton,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Center(
                      child: Text(
                    "Add contact",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

 
}
