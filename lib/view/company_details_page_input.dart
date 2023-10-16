import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:smart_factory_analyzer/api/company_api.dart';
import 'package:smart_factory_analyzer/controller/create_company_controller.dart';
import 'package:smart_factory_analyzer/controller/login.dart';
import 'package:smart_factory_analyzer/core/app_const.dart';
import 'package:smart_factory_analyzer/core/app_route.dart';
import 'package:smart_factory_analyzer/core/const.dart';
import 'package:smart_factory_analyzer/model/company_model.dart';
import 'package:smart_factory_analyzer/model/industry_group_model.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_factory_analyzer/view/widget/loading_page.dart';

class CompanyDetailsPageInput extends StatefulWidget {
  const CompanyDetailsPageInput({super.key});

  @override
  State<CompanyDetailsPageInput> createState() =>
      _CompanyDetailsPageInputState();
}

class _CompanyDetailsPageInputState extends State<CompanyDetailsPageInput> {
  final TextEditingController _companyNameController = TextEditingController();

  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _assessmentRecordController =
      TextEditingController();
  final TextEditingController _businessEntityRegistrationAssessment =
      TextEditingController();
  final TextEditingController _factorySectionController =
      TextEditingController();

  final TextEditingController _companyGroupController = TextEditingController();
  final TextEditingController _currencyController = TextEditingController();
  final TextEditingController _annualController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _employmentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [page1(), page2(), page3()];
    CreateCompanyController provider =
        Provider.of<CreateCompanyController>(context);
    return Visibility(
      visible: !provider.loading,
      replacement: LoadingWidgetForTheApp(),
      child: Scaffold(
          backgroundColor: AppConst.backgroundBlueColor,
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            toolbarHeight: ConstVariable.getHeight(context) * 0.15,
            elevation: 14,
            title: Text(
              'Company Details',
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
                Navigator.pushReplacementNamed(
                    context, AppRoute.companyDetailsGlobalPage);
                provider.resetIndexCompanyDetail();
              },
              icon: const Icon(
                Icons.chevron_left,
                color: Colors.black,
              ),
            ),
          ),
          body:
              SingleChildScrollView(child: pages[provider.indexCompanyDetail])),
    );
  }

  Widget page3() {
    CreateCompanyController provider =
        Provider.of<CreateCompanyController>(context);
    return Column(
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
            controller: _annualController,
            hintText: "annual manufacturing output"),
        ConstVariable.inputFiled(
            context: context,
            controller: _factorySectionController,
            hintText: "Factory Section"),
        ConstVariable.inputFiled(
            context: context,
            controller: _amountController,
            hintText: "Amount of func"),
        ConstVariable.inputFiled(
            isTHereNext: false,
            context: context,
            controller: _employmentController,
            hintText: "Employment size"),
        SizedBox(
          height: ConstVariable.getHeight(context) * 0.2,
        ),
        Row(
          children: [
            threeDots(context: context, index: provider.indexCompanyDetail),
            const Spacer(),
            Padding(
                padding: EdgeInsets.only(
                    left: ConstVariable.getWidth(context) * 0.02,
                    top: ConstVariable.getHeight(context) * 0.012),
                child: Ink(
                  width: 60,
                  height: 60,
                  decoration: const ShapeDecoration(
                      shape: CircleBorder(),
                      color: Color.fromARGB(255, 38, 102, 170)),
                  child: IconButton(
                    icon: const Icon(Icons.done),
                    iconSize: 24,
                    color: const Color.fromARGB(255, 0, 0, 0),
                    onPressed: () async {
                      if (_annualController.text.isNotEmpty &&
                          _amountController.text.isNotEmpty &&
                          _employmentController.text.isNotEmpty &&
                          _factorySectionController.text.isNotEmpty) {
                        final CompanyModel companyModel = CompanyModel(
                            id: "",
                            factorysection: _factorySectionController.text,
                            assessmentRecord:
                                _assessmentRecordController.text, //Todo
                            companyName: _companyNameController.text,
                            bern: _businessEntityRegistrationAssessment.text,
                            address: _addressController.text,
                            dated: DateTime.now(),
                            indusGroupId: provider.industryGroupModel.name,
                            income: int.tryParse(_amountController.text) ?? 0,
                            size: int.tryParse(_employmentController.text) ?? 0,
                            exportation: false,
                            multiproduction: false,
                            advancement: 0,
                            preparedById: Provider.of<LoginControlller>(context,
                                    listen: false)
                                .user
                                .userName);
                        print(Provider.of<LoginControlller>(context,
                                listen: false)
                            .user
                            .id);
                        print("-------------------------------");
                        provider.onChange(true);
                        CompanyApi.addCompany(
                                context: context, companyModel: companyModel)
                            .then((value) {
                          try {
                            provider.onChange(false);
                            if (((value['code'] as int) >= 200) &&
                                ((value['code'] as int) < 300)) {
                              // print(value['companyId']);

                              provider.onChangeCompanyId(
                                  value['assessmentRecord'] as String,
                                  _companyNameController.text);
                              provider.resetCompanyAdvancement();
                              Navigator.pushReplacementNamed(
                                  context, AppRoute.companyContactPage);
                            } else {
                              Fluttertoast.showToast(
                                  backgroundColor: Colors.red,
                                  msg: (value['message'] as String?) ??
                                      "somthing wrong happend",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            }
                          } catch (e) {
                            Fluttertoast.showToast(
                                backgroundColor: Colors.red,
                                msg: "somthing wrong happend",
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
                      /*Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CompanyDetailsGlobalPage()),
                      );*/
                    },
                  ),
                )),
            SizedBox(
              width: ConstVariable.getWidth(context) * 0.1,
            )
          ],
        ),
      ],
    );
  }

  Column page2() {
    CreateCompanyController provider =
        Provider.of<CreateCompanyController>(context);
    return Column(
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
        dropDownMenu(provider),
        /*ConstVariable.inputFiled(
            context: context,
            controller: _indestryGroupController,
            hintText: "industry group"),*/

        ConstVariable.inputFiled(
            context: context,
            controller: _currencyController,
            hintText: "currency"),
        SizedBox(
          height: ConstVariable.getHeight(context) * 0.2,
        ),
        Row(
          children: [
            threeDots(context: context, index: provider.indexCompanyDetail),
            const Spacer(),
            Padding(
                padding: EdgeInsets.only(
                    left: ConstVariable.getWidth(context) * 0.02,
                    top: ConstVariable.getHeight(context) * 0.012),
                child: Ink(
                  width: 60,
                  height: 60,
                  decoration: const ShapeDecoration(
                      shape: CircleBorder(),
                      color: Color.fromARGB(255, 38, 102, 170)),
                  child: IconButton(
                    icon: const Icon(Icons.chevron_right),
                    iconSize: 24,
                    color: const Color.fromARGB(255, 0, 0, 0),
                    onPressed: () {
                      if (_currencyController.text.isNotEmpty &&
                          provider.industryGroupModel != null) {
                        Provider.of<CreateCompanyController>(context,
                                listen: false)
                            .onChangeIndexCompanyDetail();
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
                      /*Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CompanyDetailsPageInput2()),
                      );*/
                    },
                  ),
                )),
            SizedBox(
              width: ConstVariable.getWidth(context) * 0.1,
            )
          ],
        ),
      ],
    );
  }

  Widget page1() {
    CreateCompanyController provider =
        Provider.of<CreateCompanyController>(context, listen: false);
    return Column(
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
            controller: _companyNameController,
            hintText: "companyName"),
        ConstVariable.inputFiled(
            context: context,
            controller: _assessmentRecordController,
            hintText: "assessmentRecord"),
        ConstVariable.inputFiled(
            context: context,
            controller: _businessEntityRegistrationAssessment,
            hintText: "Business Entity Registration"),
        ConstVariable.inputFiled(
            context: context,
            controller: _addressController,
            hintText: "address"),
        ConstVariable.inputFiled(
            context: context,
            controller: _countryController,
            hintText: "country"),
        ConstVariable.inputFiled(
            isTHereNext: false,
            context: context,
            controller: _cityController,
            hintText: "city"),
        SizedBox(
          height: ConstVariable.getHeight(context) * 0.1,
        ),
        Row(
          children: [
            threeDots(context: context, index: provider.indexCompanyDetail),
            const Spacer(),
            Padding(
                padding: EdgeInsets.only(
                    left: ConstVariable.getWidth(context) * 0.02,
                    top: ConstVariable.getHeight(context) * 0.012),
                child: Ink(
                  width: 60,
                  height: 60,
                  decoration: const ShapeDecoration(
                      shape: CircleBorder(),
                      color: Color.fromARGB(255, 38, 102, 170)),
                  child: IconButton(
                    icon: const Icon(Icons.chevron_right),
                    iconSize: 24,
                    color: const Color.fromARGB(255, 0, 0, 0),
                    onPressed: () {
                      if (_companyNameController.text.isNotEmpty &&
                          _assessmentRecordController.text.isNotEmpty &&
                          _addressController.text.isNotEmpty &&
                          _countryController.text.isNotEmpty &&
                          _cityController.text.isNotEmpty) {
                        Provider.of<CreateCompanyController>(context,
                                listen: false)
                            .onChangeIndexCompanyDetail();
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
                      /*Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CompanyDetailsPageInput1()),
                      );*/
                    },
                  ),
                )),
            SizedBox(
              width: ConstVariable.getWidth(context) * 0.1,
            )
          ],
        ),
      ],
    );
  }

  Padding threeDots({required BuildContext context, required int index}) {
    return Padding(
        padding: EdgeInsets.only(
            left: ConstVariable.getWidth(context) * 0.02,
            top: ConstVariable.getHeight(context) * 0.012),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: 0 == index
                  ? AppConst.dotsActiveColor
                  : AppConst.dotsInActiveColor,
              radius: 0 == index ? 7 : 5,
            ),
            const SizedBox(
              width: 5,
            ),
            CircleAvatar(
              backgroundColor: 1 == index
                  ? AppConst.dotsActiveColor
                  : AppConst.dotsInActiveColor,
              radius: 1 == index ? 7 : 5,
            ),
            const SizedBox(
              width: 5,
            ),
            CircleAvatar(
              backgroundColor: 2 == index
                  ? AppConst.dotsActiveColor
                  : AppConst.dotsInActiveColor,
              radius: 2 == index ? 7 : 5,
            ),
          ],
        ));
  }

  Widget dropDownMenu(CreateCompanyController provider) {
    return Container(
      height: ConstVariable.getHeight(context) * 0.07,
      width: ConstVariable.getWidth(context),
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 32, 32, 69),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: DropdownButton<IndustryGroupModel>(
        underline: const SizedBox(),
        isExpanded: true,
        dropdownColor: Color.fromARGB(255, 32, 32, 69),
        padding: EdgeInsets.symmetric(horizontal: 10),
        /*style: TextStyle(color: Colors.black,
                fontWeight: FontWeight.w300,
                fontSize: 15,),*/
        /*hint: const Text('Select a Industry Group ',style: TextStyle(color: Color.fromARGB(146, 255, 255, 255),
                fontWeight: FontWeight.w300,
                fontSize: 14,),),*/
        value: provider.industryGroupModel,
        onChanged: (IndustryGroupModel? newValue) {
          if (newValue != null) {
            provider.onChangeIndustryGroup(newValue);
          } else {
            provider.onChangeIndustryGroup(provider.listOfIndustryGroup[0]);
          }
        },
        items: provider.listOfIndustryGroup
            .sublist(1)
            .map<DropdownMenuItem<IndustryGroupModel>>(
                (IndustryGroupModel industryGroupModel) {
          return DropdownMenuItem<IndustryGroupModel>(
            value: industryGroupModel,
            child: Text(
              industryGroupModel.name,
              style: TextStyle(
                color: Color.fromARGB(180, 255, 255, 255),
                fontWeight: FontWeight.w300,
                fontSize: 14,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
