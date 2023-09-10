import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_factory_analyzer/core/app_const.dart';
import 'package:smart_factory_analyzer/core/const.dart';
import 'package:smart_factory_analyzer/model/company_contact_model.dart';

class ContactCompanyButton extends StatelessWidget {
  const ContactCompanyButton({super.key, required this.companyContactModel});
  final CompanyContactModel companyContactModel;
 

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ConstVariable.getWidth(context),
      height: ConstVariable.getHeight(context)*0.12,
      decoration: BoxDecoration(
        color: AppConst.colorCompanyDetails,
        borderRadius: const BorderRadius.all(Radius.circular(15),
        )),
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
      child: Column(
        children: [
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            SizedBox(width: ConstVariable.getWidth(context)*0.3 ,child: Text(companyContactModel.companyName,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),)),
            const Spacer(),
            SizedBox(width: ConstVariable.getWidth(context)*0.3 ,child: Text(companyContactModel.title+" "+companyContactModel.firstName,style: TextStyle(color: Colors.white,fontSize: 16),))
          ]),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            SizedBox(width: ConstVariable.getWidth(context)*0.4 ,child: Text(companyContactModel.mobileNumber.toString(),style: TextStyle(color: Colors.white,fontSize: 16),))
          ]),
          Spacer(),
        ],
      ),
    );
  }
}