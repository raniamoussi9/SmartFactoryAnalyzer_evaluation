import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:smart_factory_analyzer/core/app_const.dart';
import 'package:smart_factory_analyzer/model/company_contact_model.dart';
import 'package:smart_factory_analyzer/view/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      replacement: Scaffold(
          body: Container(
        alignment: Alignment.center,
        height: ConstVariable.getWidth(context) * 0.4,
        width: ConstVariable.getWidth(context) * 0.4,
        child: const CircularProgressIndicator(),
      )),
      visible: !provider.loading,
      child: Scaffold(
        backgroundColor: AppConst.backgroundBlueColor,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          toolbarHeight: screenHight * 0.15,
          elevation: 14,
          title: Center(
              child: Text(
            'Company Contacts',
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.black,
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
              inputFiled(
                  screenHight: screenHight,
                  screenWidht: screenWidht,
                  controller: _designationController,
                  hintText: "Designation"),
              inputFiled(
                  screenHight: screenHight,
                  screenWidht: screenWidht,
                  controller: _firstNameController,
                  hintText: "First Name"),
              inputFiled(
                  screenHight: screenHight,
                  screenWidht: screenWidht,
                  controller: _lastNameController,
                  hintText: "Last Name"),
              inputFiled(
                  screenHight: screenHight,
                  screenWidht: screenWidht,
                  controller: _titleController,
                  hintText: "Title"),
              inputFiled(
                  screenHight: screenHight,
                  screenWidht: screenWidht,
                  controller: _emailController,
                  hintText: "Email"),
              inputFiled(
                  screenHight: screenHight,
                  screenWidht: screenWidht,
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
                        Navigator.pop(context);
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
