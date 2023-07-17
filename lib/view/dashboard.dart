import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_factory_analyzer/controller/login.dart';
import 'package:smart_factory_analyzer/view/company_details.dart';
import 'package:smart_factory_analyzer/view/company_prograss.dart';
import 'package:smart_factory_analyzer/view/login_page.dart';

import '../model/Indus.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<StatefulWidget> createState() => DashboardState();
}

var b = const Color.fromRGBO(255, 255, 255, 1);

class DashboardState extends State<Dashboard> {
  final controller = TextEditingController();
  List<Indus> induss = allIndus;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.height;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const CompanyDetails())),
        ),
        body: SafeArea(
          child: Container(
            height: screenHeight,
            color: const Color.fromRGBO(36, 36, 93, 1),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  bloc1(height: screenHeight, width: screenWidth),
                  const SizedBox(
                    height: 10,
                  ),
                  bloc2(),
                  const SizedBox(
                    height: 10,
                  ),
                  bloc3(
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      text: "Decade",
                      value: 0.5),
                  bloc3(
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      text: "Enova Robotic",
                      value: 0.8),
                  bloc3(
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      text: "machines talk",
                      value: 0.3),
                  bloc3(
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      text: "sofia tech",
                      value: 0.2),
                ],
              ),
            ),
          ),
        ));
  }

  Widget bloc3(
      {required double screenHeight,
      required double screenWidth,
      required double value,
      required String text}) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return CompanyPrograss(
            progress: value,
            name: text,
          );
        }));
      },
      child: Container(
        margin: EdgeInsets.only(
            left: screenWidth * 0.03,
            top: screenHeight * 0.015,
            right: screenWidth * 0.03,
            bottom: screenHeight * 0.015),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromRGBO(167, 202, 240, 1),
        ),
        width: screenWidth,
        height: screenHeight * 0.2,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    text,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Text('designation')
                ],
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(top: 35, bottom: 20),
                child: const Text(
                  'Assesment Progress',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              LinearProgressIndicator(
                backgroundColor: const Color.fromRGBO(150, 226, 242, 1),
                value: value,
                color: const Color.fromRGBO(36, 36, 93, 1),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bloc2() {
    //SingleChildScrollView(
    // scrollDirection: Axis.horizontal,
    //padding: const EdgeInsets.all(10),

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "all",
          "Designation 1",
          "Designation 2",
          "Designation 3",
          "Designation 4"
        ]
            .map(
              (e) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: TextButton(
                  onPressed: () => setState(() {}),
                  style: TextButton.styleFrom(
                      backgroundColor: b,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: Text(e.toString()),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Container bloc1({required double height, required double width}) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      width: width,
      height: height * 0.25,
      child: Column(children: [
        Padding(
          padding: EdgeInsets.only(
              top: height * 0.02, left: width * 0.02, bottom: height * 0.02),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Hello,${Provider.of<LoginControlller>(context).userName}',
                style: (const TextStyle(
                    fontSize: 25, fontWeight: FontWeight.bold)),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () async {
                  final LoginControlller provider =
                      Provider.of<LoginControlller>(context, listen: false);
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setBool('isConnected', true).then((value) {
                    provider.setUserName("");
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) {
                      return LoginPage();
                    }));
                  });
                },
                child: const CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 25,
                  child: Icon(
                    Icons.person_outlined,
                    color: Colors.black,
                    size: 40,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'search',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(36, 36, 93, 1)))),
            onChanged: searchinduss,
          ),
        ),
      ]),
    );
  }

  void searchinduss(String query) {
    final suggestions = allIndus.where((indus) {
      final industitle = indus.title.toLowerCase();
      final input = query.toLowerCase();
      return industitle.contains(input);
    }).toList();

    setState(() => induss = suggestions);
  }
}
