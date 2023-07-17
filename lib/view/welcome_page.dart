// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:smart_factory_analyzer/utils/const.dart';
import 'login_page.dart';

Color myColor = Color.fromARGB(255, 36, 36, 93);
Color myColor2 = Color.fromRGBO(49, 195, 231, 1);
Color myColor3 = Color.fromRGBO(167, 202, 240, 1);
Color myColor4 = Color.fromRGBO(32, 32, 69, 1);

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.45,
            width: ConstVariable.getWidth(context)*1,
            decoration: BoxDecoration(
              color: myColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Center(
                child: Image.asset(
              'images/man.png',
              height: MediaQuery.of(context).size.height * 0.65,
              width: MediaQuery.of(context).size.width * 0.65,
            )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  child: Center(
                child: Image.asset(
                  'images/siri.png',
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.height * 0.15,
                ),
              )),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.height * 0.1,
              ),
              SizedBox(
                  child: Center(
                child: Image.asset(
                  'images/novation.png',
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.height * 0.15,
                ),
              )),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.12,
            width: MediaQuery.of(context).size.width * 1,
            child: Center(
                child: Text(
              'The Smart Industry Readiness Index (SIRI) comprises \na suite offrameworks and tools to help manufacturers – \nregardless of sizeand Industry – start, scale and sustain \ntheir manufacturing transformation journeys.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: MediaQuery.of(context).size.height * 0.015,
              ),
            )),
          ),
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.08,
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: myColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.26,
                    vertical: 20),
              ),
              child: Text(
                'Get Started',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.height * 0.017),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
