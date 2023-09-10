import 'package:flutter/material.dart';
import 'package:smart_factory_analyzer/core/const.dart';

import '../../core/app_const.dart';

class LoadingWidgetForTheApp extends StatelessWidget {
  const LoadingWidgetForTheApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        height: ConstVariable.getWidth(context)*0.4,
        width: ConstVariable.getWidth(context)*0.4,
        child: CircularProgressIndicator(color: AppConst.colorCompanyDetails,)),
    );
  }
}