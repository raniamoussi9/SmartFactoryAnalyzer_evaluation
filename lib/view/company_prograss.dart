import 'package:flutter/material.dart';
import 'package:smart_factory_analyzer/core/app_const.dart';
import 'package:smart_factory_analyzer/core/app_route.dart';
import 'package:smart_factory_analyzer/view/dashboard.dart';
import 'package:smart_factory_analyzer/view/dim10/band10.dart';
import 'package:smart_factory_analyzer/view/dim11/band11.dart';
import 'package:smart_factory_analyzer/view/dim14/band14.dart';
import 'package:smart_factory_analyzer/view/dim15/band15.dart';
import 'package:smart_factory_analyzer/view/dim16/band16.dart';
import 'package:smart_factory_analyzer/view/dim2/band2.dart';
import 'package:smart_factory_analyzer/view/dim3/band3.dart';
import 'package:smart_factory_analyzer/view/dim4/band4.dart';
import 'package:smart_factory_analyzer/view/dim5/band5.dart';
import 'package:smart_factory_analyzer/view/dim6/band6.dart';
import 'package:smart_factory_analyzer/view/dim7/band7.dart';
import 'package:smart_factory_analyzer/view/dim9/band9.dart';

import '../model/Indus.dart';
import 'dim1/band1.dart';
import 'dim12/band12.dart';
import 'dim13/band13.dart';
import 'dim8/band8.dart';

class CompanyPrograss extends StatefulWidget {
  const CompanyPrograss(
      {super.key, required this.progress, required this.name});
  final double progress;
  final String name;

  @override
  State<StatefulWidget> createState() => CompanyPrograssState();
}

var b = const Color.fromRGBO(255, 255, 255, 1);
Color myColor = AppConst.backgroundBlueColor;

class CompanyPrograssState extends State<CompanyPrograss> {
  final controller = TextEditingController();
  List<Indus> induss = allIndus;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
      child: Container(
        height: screenHeight,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              bloc1(height: screenHeight, width: screenWidth),
              const SizedBox(
                height: 10,
              ),
              //bloc2(),
              const SizedBox(
                height: 10,
              ),
              bloc3(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) {
                      return Band1();
                    }));
                  },
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  text: "Operations - Vertical Integration",
                  value: 0),
              bloc3(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) {
                      return Band2();
                    }));
                  },
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  text: "Supply chain - Horizontal",
                  value: 0),
              bloc3(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) {
                      return Band3();
                    }));
                  },
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  text: "Product Lifecycle-\nIntegrated Product Lifecycle",
                  value: 0),
              bloc3(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) {
                      return Band4();
                    }));
                  },
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  text: "Automation - Shop floor Automation",
                  value: 0),
              bloc3(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) {
                      return Band5();
                    }));
                  },
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  text: "Automation - Entreprise Automation",
                  value: 0),
              bloc3(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) {
                      return Band6();
                    }));
                  },
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  text: "Automation - Facility",
                  value: 0),
              bloc3(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) {
                      return Band7();
                    }));
                  },
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  text: "Connectivity - Shop floor\nConnectivity",
                  value: 0),
              bloc3(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) {
                      return Band8();
                    }));
                  },
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  text: "Connectivity - Entreprise\nConnectivity",
                  value: 0),
              bloc3(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) {
                      return Band9();
                    }));
                  },
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  text: "Connectivity - Facility Connectivity",
                  value: 0),
              bloc3(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) {
                      return Band10();
                    }));
                  },
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  text: "Intelligence - Shop floor Intelligence",
                  value: 0),
              bloc3(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) {
                      return Band11();
                    }));
                  },
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  text: "Intelligence - Entreprise Intelligence",
                  value: 0),
              bloc3(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) {
                      return Band12();
                    }));
                  },
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  text: "Intelligence - Facility Intelligence",
                  value: 0),
              bloc3(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) {
                      return Band13();
                    }));
                  },
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  text: "Talent Readiness-\nWorkforce Learning & Development",
                  value: 0),
              bloc3(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) {
                      return Band14();
                    }));
                  },
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  text: "Talent Readiness-\nLeadership Competency",
                  value: 0),
              bloc3(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) {
                      return Band15();
                    }));
                  },
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  text:
                      "Structure & Management-Inter-and\nIntra - Company Collaboration",
                  value: 0),
              bloc3(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) {
                      return Band16();
                    }));
                  },
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  text: "Stategy and Governance",
                  value: 0),
            ],
          ),
        ),
      ),
    ));
  }

  Widget bloc3(
      {required double screenHeight,
      required double screenWidth,
      required Function() onTap,
      required double value,
      required String text}) {
    return GestureDetector(
      onTap: onTap,
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
                  Icon(
                    Icons.notifications,
                    color: Colors.black,
                  )
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
                child: ElevatedButton(
                  onPressed: () => setState(() {}),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
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
        color: Color.fromARGB(255, 36, 36, 93),
      ),
      width: width,
      height: height * 0.29,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return const DashboardPage();
                    }));
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  )),
              const Spacer(
                flex: 1,
              ),
              Text(
                widget.name,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
          Center(
              child: Text(
            "${widget.progress * 100}%",
            style: TextStyle(
                fontSize: height * 0.08,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, AppRoute.showContactCompanyPage);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      fixedSize: Size(width * 0.2, 30)),
                  child: const Text(
                    "Contact",
                    style: TextStyle(color: Colors.black),
                  )),
              SizedBox(
                width: width * 0.015,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, AppRoute.showDetailsPage);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(49, 195, 231, 1),
                      fixedSize: Size(width * 0.2, 30)),
                  child: const Text("Details")),
            ],
          )
        ]),
      ),
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
