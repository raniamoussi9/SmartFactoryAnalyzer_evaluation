import 'package:flutter/material.dart';
import 'package:smart_factory_analyzer/view/company_contact_page.dart';
import 'package:smart_factory_analyzer/view/company_details.dart';
import 'package:smart_factory_analyzer/view/dashboard.dart';
import 'package:smart_factory_analyzer/view/dim10/quest1.dart';
import 'package:smart_factory_analyzer/view/show_contact_Company.dart';
import 'package:smart_factory_analyzer/view/show_details_company_page.dart';

import '../view/login_page.dart';
import '../view/splash_screen.dart';
import '../view/welcome_page.dart';

class AppRoute {
  /* commun route for both user and admin */
  static String splashScreen = "/splashScreen";
  static String welcomeScreen = "/welcomeScreen";
  static String logInScreen = "/logInScreen";
  static String dashBoardScreen = "/dashboardScreen";
  static String companyDetailsGlobalPage = "/companyDetailGlobalPage";
  static String companyContactPage = "/companyCompanyContactPage";
  static String question1Dim1 = "/Question1Dim1";
  static String showDetailsPage = "/showDetailPage";
  static String showContactCompanyPage = "/showContactCompanyPage";

  static final Map<String, Widget Function(BuildContext context)> appRoute = {
    splashScreen: (context) => const SplashScreen(),
    welcomeScreen: (context) => WelcomePage(),
    logInScreen: (context) => const LoginPage(),
    dashBoardScreen: (context) => const DashboardPage(),
    companyDetailsGlobalPage: (context) => const CompanyDetailsGlobalPage(),
    companyContactPage: (context) => const CompanyContactPage(),
    question1Dim1: (context) => const Quest1dim10(),
    showDetailsPage: (context) => const ShowDetailsCompanyPage(),
    showContactCompanyPage : (context) => const ShowContactCompany(),
  };
}
