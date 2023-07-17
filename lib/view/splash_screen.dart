
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_factory_analyzer/view/dashboard.dart';

import 'login_page.dart';




class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:EasySplashScreen(
        backgroundColor: Colors.white,
        logo: Image.asset('images/siri.png'),
        logoWidth: 170,
     
        //title: const Text('Bienvenue',style: TextStyle(fontSize: 30,fontStyle: FontStyle.italic,color: Colors.blue),),
        //showLoader: true,
        //loadingText: const Text('Loading....',style: TextStyle(color: Colors.blue,fontSize: 10)),
        navigator:  FutureBuilder(
                  future: SharedPreferences
                      .getInstance(), // stream data to listen for change
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final bool value =
                          snapshot.data!.getBool("isConnected") ?? false;
                      if (!value) {
                        return const LoginPage();
                      } else {
                        return const Dashboard();
                      }
                    } else {
                      return const CircularProgressIndicator();
                    }}),
        durationInSeconds: 2,
        ),
    );
  }
}