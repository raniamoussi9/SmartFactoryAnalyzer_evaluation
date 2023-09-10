import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_factory_analyzer/controller/create_company_controller.dart';
import 'package:smart_factory_analyzer/controller/dasboard_controller.dart';
import 'package:smart_factory_analyzer/controller/login.dart';
import 'package:smart_factory_analyzer/core/app_route.dart';

import 'controller/dimensionController.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<LoginControlller>(
          create: (_) => LoginControlller()),
      ChangeNotifierProvider<DashBoardController>(
          create: (_) => DashBoardController()),
      ChangeNotifierProvider<CreateCompanyController>(
          create: (_) => CreateCompanyController()),
          ChangeNotifierProvider<DimensionController>(
          create: (_) => DimensionController()),
     
      //Provider<AnotherThing>(create: (_) => AnotherThing()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SIRI App',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.splashScreen,
      routes: AppRoute.appRoute,
    );
  }
}
