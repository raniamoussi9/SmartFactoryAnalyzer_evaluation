

import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_factory_analyzer/view/dashboard.dart';
import 'package:smart_factory_analyzer/view/welcome_page.dart';

import 'login_page.dart';




class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future<bool> isConnected() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      try {
        return prefs.getBool("isConnected")!;
      } catch (e) {
        return false;
      }
    }
    return Scaffold(
      body:EasySplashScreen(
        backgroundColor: Colors.white,
        logo: Image.asset('images/siri.png'),
        logoWidth: 170,
     
        //title: const Text('Bienvenue',style: TextStyle(fontSize: 30,fontStyle: FontStyle.italic,color: Colors.blue),),
        //showLoader: true,
        //loadingText: const Text('Loading....',style: TextStyle(color: Colors.blue,fontSize: 10)),
        navigator:  FutureBuilder<bool>(
          future: isConnected(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              debugPrint(snapshot.error.toString());
            } else if (snapshot.connectionState == ConnectionState.done &&
                snapshot.data!) {
              
              return DashboardPage();
            } else if (snapshot.connectionState == ConnectionState.done &&
                !snapshot.data!) {
              return WelcomePage();
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
        durationInSeconds: 2,
        ),
    );
  }
}