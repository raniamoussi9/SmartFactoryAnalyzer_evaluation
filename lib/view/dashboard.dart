import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_factory_analyzer/api/dasboard_api.dart';
import 'package:smart_factory_analyzer/controller/create_company_controller.dart';
import 'package:smart_factory_analyzer/controller/dimensionController.dart';
import 'package:smart_factory_analyzer/controller/login.dart';
import 'package:smart_factory_analyzer/core/const.dart';
import 'package:smart_factory_analyzer/model/company_model.dart';
import 'package:smart_factory_analyzer/model/industry_group_model.dart';
import 'package:smart_factory_analyzer/view/company_details.dart';
import 'package:smart_factory_analyzer/view/company_prograss.dart';
import 'package:smart_factory_analyzer/view/widget/emptyList.dart';

import '../api/company_api.dart';
import '../model/Indus.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<StatefulWidget> createState() => DashboardPageState();
}

var b = const Color.fromRGBO(255, 255, 255, 1);

class DashboardPageState extends State<DashboardPage> {
  String industryGroupId = "";
  List<IndustryGroupModel> industryGroupList = [];
  List<CompanyModel> companyList = [];
  List<CompanyModel> realCompanyList = [];
  bool isReady = false;
  bool isReadyBloc1 = true;

  @override
  void initState() {
    CompanyApi.getCompanies(context: context, industryId: "")!.then((value) {
      setState(() {
        companyList = value;
        realCompanyList = value;
      });
    });
    DashboardApi.getIndustryGroup()!.then((value) {
      industryGroupList = value;
      Future.delayed(Duration.zero, () {
        Provider.of<CreateCompanyController>(context, listen: false)
            .setListOfIndustryGroup(value);
      });
      industryGroupList.insert(0, IndustryGroupModel(name: "all", id: ""));
      setState(() {
        isReady = true;
      });
    });
    super.initState();
  }

  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.height;
    return Visibility(
      visible: isReady,
      replacement: const Scaffold(
          body: Center(
        child: SizedBox(child: CircularProgressIndicator()),
      )),
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const CompanyDetailsGlobalPage())),
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
                    Visibility(
                      replacement: const EmptyList(),
                      child: SizedBox(
                        height: ConstVariable.getHeight(context) * 0.07,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: industryGroupList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              child: TextButton(
                                onPressed: () async {
                                  setState(() {
                                    if (index == 0) {
                                      industryGroupId =
                                          industryGroupList[index].id;
                                    } else {
                                      industryGroupId =
                                          industryGroupList[index].name;
                                    }
                                    isReadyBloc1 = false;
                                  });
                                  companyList = await CompanyApi.getCompanies(
                                      context: context,
                                      industryId: industryGroupId)!;
                                  setState(() {
                                    isReadyBloc1 = true;
                                  });
                                },
                                style: TextButton.styleFrom(
                                    backgroundColor: b,
                                    foregroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                                child: Text(industryGroupList[index].name),
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    Visibility(
                      visible: isReadyBloc1,
                      replacement:
                          const Center(child: CircularProgressIndicator()),
                      child: Visibility(
                        visible: companyList.isNotEmpty,
                        replacement: const EmptyList(),
                        child: SizedBox(
                          height: ConstVariable.getHeight(context) * 0.6,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: companyList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return bloc3(
                                  screenHeight:
                                      ConstVariable.getHeight(context),
                                  screenWidth: ConstVariable.getHeight(context),
                                  value: 0.2,
                                  company: companyList[index]);
                            },
                          ),
                        ),
                      ),
                    )
                    //futureBloc3(industryGroupId: industryGroupId)
                  ],
                ),
              ),
            ),
          )),
    );
  }

  Widget bloc3(
      {required double screenHeight,
      required double screenWidth,
      required double value,
      required CompanyModel company}) {
    return GestureDetector(
      onTap: () {
        Provider.of<CreateCompanyController>(context, listen: false)
            .onChangeCompanyId(company.assessmentRecord, company.companyName);
        Provider.of<DimensionController>(context, listen: false)
            .onChange(company.companyName);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return CompanyPrograss(
            progress: value,
            name: company.companyName,
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
                    company.companyName,
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

  Widget futureBloc3({required String industryGroupId}) {
    return FutureBuilder<List<CompanyModel>>(
      future: CompanyApi.getCompanies(
          context: context, industryId: industryGroupId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
              width: 50, height: 50, child: const CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          print(snapshot.data!);
          List<CompanyModel> comapanyList = snapshot.data!;
          if (comapanyList.isEmpty) {
            return const Text("hi");
          } else {
            return SizedBox(
              height: ConstVariable.getHeight(context) * 0.6,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: comapanyList.length,
                itemBuilder: (BuildContext context, int index) {
                  return bloc3(
                      screenHeight: ConstVariable.getHeight(context),
                      screenWidth: ConstVariable.getHeight(context),
                      value: 0.2,
                      company: comapanyList[index]);
                },
              ),
            );
          }
        }
      },
    );
  }

  Widget futureBloc2() {
    return FutureBuilder<List<IndustryGroupModel>>(
      future: DashboardApi.getIndustryGroup(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
              width: 50, height: 50, child: const CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<IndustryGroupModel> industryGroupList = snapshot.data!;
          if (industryGroupList.isEmpty) {
            return const Text("hi");
          } else {
            industryGroupList.insert(
                0, IndustryGroupModel(name: "all", id: ""));
            return SizedBox(
              height: ConstVariable.getHeight(context) * 0.07,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: industryGroupList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    child: TextButton(
                      onPressed: () => setState(() {
                        if (index == 0) {
                          industryGroupId = industryGroupList[index].id;
                        } else {
                          industryGroupId = industryGroupList[index].name;
                        }
                      }),
                      style: TextButton.styleFrom(
                          backgroundColor: b,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      child: Text(industryGroupList[index].name),
                    ),
                  );
                },
              ),
            );
          }
        }
      },
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
                'Hello,${Provider.of<LoginControlller>(context).user.userName}',
                style: (const TextStyle(
                    fontSize: 25, fontWeight: FontWeight.bold)),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () async {
                  /* final LoginControlller provider =
                      Provider.of<LoginControlller>(context, listen: false);
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setBool('isConnected', true).then((value) {
                    provider.setUserName("");
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) {
                      return LoginPage();
                    }));
                  });*/ //TODO
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
    final suggestions = realCompanyList.where((company) {
      final industitle = company.companyName.toLowerCase();
      final input = query.toLowerCase();
      return industitle.contains(input);
    }).toList();

    setState(() => companyList = suggestions);
  }
}
