import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:smart_factory_analyzer/core/app_const.dart';
import 'package:smart_factory_analyzer/core/app_route.dart';
import 'package:smart_factory_analyzer/view/dashboard.dart';

import '../controller/create_company_controller.dart';
import '../model/Indus.dart';
import 'dim1/band1.dart';
import 'dim1/ques1.dart';

class CompanyPrograss extends StatefulWidget {
  const CompanyPrograss({
    super.key,
  });

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
    var providerCompany =
        Provider.of<CreateCompanyController>(context, listen: false);
    return Scaffold(
        body: SafeArea(
      child: Container(
        height: screenHeight,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              bloc1(
                  height: screenHeight,
                  width: screenWidth,
                  provider: providerCompany),
              const SizedBox(
                height: 10,
              ),
              //bloc2(),
              const SizedBox(
                height: 10,
              ),
              bloc3(
                  onTap: () {
                    if (!(providerCompany.companyAdvencement >= 6.25)) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) {
                        return const Question1Dim1(index: 0);
                      }));
                    } else {
                      Fluttertoast.showToast(
                          backgroundColor: Colors.red,
                          msg: 'you just finish this one',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  },
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  text: "Operations - Vertical Integration",
                  value:
                      (providerCompany.companyAdvencement >= 6.25) ? 100 : 0),
              bloc3(
                  onTap: () {
                    if (!(providerCompany.companyAdvencement >= 12.5)) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) {
                        return const Question1Dim1(index: 1);
                      }));
                    } else {
                      Fluttertoast.showToast(
                          backgroundColor: Colors.red,
                          msg: 'you just finish this one',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  },
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  text: "Supply chain - Horizontal",
                  value:
                      (providerCompany.companyAdvencement >= 12.5) ? 100 : 0),
              bloc3(
                  onTap: () {
                    if (!(providerCompany.companyAdvencement >= 18.75)) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) {
                        return const Question1Dim1(index: 2);
                      }));
                    } else {
                      Fluttertoast.showToast(
                          backgroundColor: Colors.red,
                          msg: 'you just finish this one',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  },
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  text: "Product Lifecycle-\nIntegrated Product Lifecycle",
                  value:
                      (providerCompany.companyAdvencement >= 18.75) ? 100 : 0),
              bloc3(
                  onTap: () {
                    if (!(providerCompany.companyAdvencement >= 25)) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) {
                        return const Question1Dim1(index: 3);
                      }));
                    }
                    {
                      Fluttertoast.showToast(
                          backgroundColor: Colors.red,
                          msg: 'you just finish this one',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  },
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  text: "Automation - Shop floor Automation",
                  value: (providerCompany.companyAdvencement >= 25) ? 100 : 0),
              bloc3(
                  onTap: () {
                    if (!(providerCompany.companyAdvencement >= (6.25 * 5))) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) {
                        return const Question1Dim1(index: 4);
                      }));
                    } else {
                      Fluttertoast.showToast(
                          backgroundColor: Colors.red,
                          msg: 'you just finish this one',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  },
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  text: "Automation - Entreprise Automation",
                  value: (providerCompany.companyAdvencement >= (6.25 * 5))
                      ? 100
                      : 0),
              bloc3(
                  onTap: () {
                    if (!(providerCompany.companyAdvencement >= (6.25 * 6))) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) {
                        return const Question1Dim1(index: 5);
                      }));
                    }else {
                      Fluttertoast.showToast(
                          backgroundColor: Colors.red,
                          msg: 'you just finish this one',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  },
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  text: "Automation - Facility",
                  value: (providerCompany.companyAdvencement >= (6.25 * 6))
                      ? 100
                      : 0),
              bloc3(
                  onTap: () {
                    if (!(providerCompany.companyAdvencement >= (6.25 * 7))) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) {
                      return const Question1Dim1(index: 6);
                    }));}else {
                      Fluttertoast.showToast(
                          backgroundColor: Colors.red,
                          msg: 'you just finish this one',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  },
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  text: "Connectivity - Shop floor\nConnectivity",
                  value: (providerCompany.companyAdvencement >= (6.25 * 7))
                      ? 100
                      : 0),
              bloc3(
                  onTap: () {
                    if (!(providerCompany.companyAdvencement >= (6.25 * 8))) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) {
                      return const Question1Dim1(index: 7);
                    }));}else {
                      Fluttertoast.showToast(
                          backgroundColor: Colors.red,
                          msg: 'you just finish this one',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  },
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  text: "Connectivity - Entreprise\nConnectivity",
                  value: (providerCompany.companyAdvencement >= (6.25 * 8))
                      ? 100
                      : 0),
              bloc3(
                  onTap: () {
                    if (!(providerCompany.companyAdvencement >= (6.25 * 9))) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) {
                      return const Question1Dim1(index: 8);
                    }));}else {
                      Fluttertoast.showToast(
                          backgroundColor: Colors.red,
                          msg: 'you just finish this one',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  },
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  text: "Connectivity - Facility Connectivity",
                  value: (providerCompany.companyAdvencement >= (6.25 * 9))
                      ? 100
                      : 0),
              bloc3(
                  onTap: () {
                    if (!(providerCompany.companyAdvencement >= (6.25 * 10))) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) {
                      return const Question1Dim1(index: 9);
                    }));}else {
                      Fluttertoast.showToast(
                          backgroundColor: Colors.red,
                          msg: 'you just finish this one',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  },
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  text: "Intelligence - Shop floor Intelligence",
                  value: (providerCompany.companyAdvencement >= (6.25 * 10))
                      ? 100
                      : 0),
              bloc3(
                  onTap: () {
                   if (!(providerCompany.companyAdvencement >= (6.25 * 11))) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) {
                      return const Question1Dim1(index: 10);
                    }));}else {
                      Fluttertoast.showToast(
                          backgroundColor: Colors.red,
                          msg: 'you just finish this one',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  },
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  text: "Intelligence - Entreprise Intelligence",
                  value: (providerCompany.companyAdvencement >= (6.25 * 11))
                      ? 100
                      : 0),
              bloc3(
                  onTap: () {
                    if (!(providerCompany.companyAdvencement >= (6.25 * 12))) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) {
                      return const Question1Dim1(index: 11);
                    }));}else {
                      Fluttertoast.showToast(
                          backgroundColor: Colors.red,
                          msg: 'you just finish this one',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  },
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  text: "Intelligence - Facility Intelligence",
                  value: (providerCompany.companyAdvencement >= (6.25 * 12))
                      ? 100
                      : 0),
              bloc3(
                  onTap: () {
                    if (!(providerCompany.companyAdvencement >= (6.25 * 13))) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) {
                      return const Question1Dim1(index: 12);
                    }));}else {
                      Fluttertoast.showToast(
                          backgroundColor: Colors.red,
                          msg: 'you just finish this one',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  },
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  text: "Talent Readiness-\nWorkforce Learning & Development",
                  value: (providerCompany.companyAdvencement >= (6.25 * 13))
                      ? 100
                      : 0),
              bloc3(
                  onTap: () {
                    if (!(providerCompany.companyAdvencement >= (6.25 * 14))) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) {
                      return const Question1Dim1(index: 13);
                    }));}else {
                      Fluttertoast.showToast(
                          backgroundColor: Colors.red,
                          msg: 'you just finish this one',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  },
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  text: "Talent Readiness-\nLeadership Competency",
                  value: (providerCompany.companyAdvencement >= (6.25 * 14))
                      ? 100
                      : 0),
              bloc3(
                  onTap: () {
                   if (!(providerCompany.companyAdvencement >= (6.25 * 15))) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) {
                      return const Question1Dim1(index: 14);
                    }));}else {
                      Fluttertoast.showToast(
                          backgroundColor: Colors.red,
                          msg: 'you just finish this one',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  },
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  text:
                      "Structure & Management-Inter-and\nIntra - Company Collaboration",
                  value: (providerCompany.companyAdvencement >= (6.25 * 15))
                      ? 100
                      : 0),
              bloc3(
                  onTap: () {
                    
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) {
                      return const Question1Dim1(index: 15);
                    }));
                  },
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  text: "Stategy and Governance",
                  value: (providerCompany.companyAdvencement >= (6.25 * 16))
                      ? 100
                      : 0),
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
                  const Icon(
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

  Container bloc1(
      {required double height,
      required double width,
      required CreateCompanyController provider}) {
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
                provider.companyName,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
          Center(
              child: Text(
            "${provider.companyAdvencement}%",
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
