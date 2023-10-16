import 'package:flutter/material.dart';
import 'package:smart_factory_analyzer/view/company_contact_page.dart';
import 'package:smart_factory_analyzer/view/company_details_global_page.dart';
import 'package:smart_factory_analyzer/view/dashboard.dart';
import 'package:smart_factory_analyzer/view/evaluation/cost_category.dart';
import 'package:smart_factory_analyzer/view/evaluation/planning_horizon_page.dart';

import 'package:smart_factory_analyzer/view/show_contact_Company.dart';
import 'package:smart_factory_analyzer/view/show_details_company_page.dart';

import '../view/company_assessment_dates.dart';
import '../view/company_scope_assessment.dart';
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
  static String band1 = "/band1";
  static String questions1 = "/questions";
  static String costCategory = "/costCategory";
  static String scopeOfAssessment = "/scopeOfAssessment";
  static String assessmentDatesPage = "/assessmentDatesPage";
  static String planningHorizon = "/planningHorizon";

  static final Map<String, Widget Function(BuildContext context)> appRoute = {
    splashScreen: (context) => const SplashScreen(),
    welcomeScreen: (context) => WelcomePage(),
    logInScreen: (context) => const LoginPage(),
    dashBoardScreen: (context) => const DashboardPage(),
    companyDetailsGlobalPage: (context) => const CompanyDetailsGlobalPage(),
    companyContactPage: (context) => const CompanyContactPage(),
    showDetailsPage: (context) => const ShowDetailsCompanyPage(),
    showContactCompanyPage: (context) => const ShowContactCompany(),
    costCategory: (context) => CostCategory(),
    scopeOfAssessment: (context) => const ScopeOfAssesementPage(),
    assessmentDatesPage: (context) => const AssessmentDatesPage(),
    planningHorizon : (context) => PlanningHorizonPage()
  };
}
