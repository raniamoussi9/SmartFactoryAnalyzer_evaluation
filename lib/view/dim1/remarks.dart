import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:smart_factory_analyzer/api/company_api.dart';
import 'package:smart_factory_analyzer/view/dim1/ques1.dart';
import 'package:smart_factory_analyzer/view/dim1/input_remarks.dart';
import 'package:smart_factory_analyzer/view/evaluation/cost_category.dart';

import '../../api/dimension_api.dart';
import '../../controller/create_company_controller.dart';
import '../../controller/dimension_controller.dart';
import '../../controller/login.dart';
import '../../model/dimension_model.dart';
import '../company_prograss.dart';
import '../dashboard.dart';

class Remarks extends StatefulWidget {
  const Remarks({super.key, required this.index});
  final int index;

  @override
  State<StatefulWidget> createState() => RemarksState();
}

class RemarksState extends State<Remarks> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    DimensionController provider = Provider.of<DimensionController>(context);
    CreateCompanyController providerCompany =
        Provider.of<CreateCompanyController>(context);

    return Scaffold(
        body: SafeArea(
            child: Container(
                height: double.infinity,
                color: const Color.fromRGBO(36, 36, 93, 1),
                child: SingleChildScrollView(
                    child: Column(children: [
                  bloc1(height: screenHeight),
                  Container(
                    height: screenHeight * 0.3,
                    margin: const EdgeInsets.only(
                        top: 50, left: 20, right: 20, bottom: 50),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(150, 226, 242, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                        'L’Industrie 4.0 est la plus récente évolution dans le secteur de la fabrication. Au cours des 250 dernières années, plusieurs révolutions Industrielles ont transformé les méthodes de fabrication des biens.'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment
                        .end, // juste maareftch kfh les buttons nhotehom fel lekher mtaa el page
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddRem(),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(255, 255, 255, 1),
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: const Padding(
                          padding: EdgeInsets.only(
                              top: 10.0, bottom: 10, left: 40, right: 40),
                          child: Text('Add Remark'),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          LoginControlller providerLogin =
                              Provider.of<LoginControlller>(context,
                                  listen: false);
                          var dim = DimensionModel(
                              dimensionAssesement: provider.bandIndex,
                              bandComment: provider.dimResponse.toString(),
                              dimensionId: widget.index + 1,
                              assessmentRecord: providerCompany.companyId);
                          provider.onChangeLoading(true);
                          
                          DimensionApi.addDim(
                                  context: context, dimensionModel: dim)
                              .then((value) {
                            print(value);
                            try {
                              if (((value['code'] as int) >= 200) &&
                                  ((value['code'] as int) < 300)) {
                                CompanyApi.updateCompanyAdvance(
                                        Provider.of<CreateCompanyController>(
                                                context,
                                                listen: false)
                                            .companyId)
                                    .then((value) {
                                  if (((value['code'] as int) >= 200) &&
                                      ((value['code'] as int) < 300)) {
                                    provider.onChangeLoading(false);
                                    Provider.of<CreateCompanyController>(
                                            context,
                                            listen: false)
                                        .onChangeCompanyAdvancement();
                                  } else {
                                    provider.onChangeLoading(false);
                                    Fluttertoast.showToast(
                                    backgroundColor: Colors.red,
                                    msg: (value['message'] as String?) ??
                                        "somthing wrong happend",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                                  }
                                });
                                provider.resetQuestionIndex();
                                provider.restBandIndex();
                                provider.resetDim();

                                if (!(widget.index >= 15)) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Question1Dim1(
                                              index: widget.index + 1,
                                            )),
                                  );
                                } else {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CostCategory()),
                                  );
                                }
                              } else {
                                Fluttertoast.showToast(
                                    backgroundColor: Colors.red,
                                    msg: (value['message'] as String?) ??
                                        "somthing wrong happend",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              }
                            } catch (e) {
                              Fluttertoast.showToast(
                                  backgroundColor: Colors.red,
                                  msg: "somthing wrong happend",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            }
                          });
                          provider.resetQuestionIndex();
                        },
                        style: TextButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(38, 101, 170, 1),
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: const Padding(
                          padding: EdgeInsets.only(
                              top: 10.0, bottom: 10, left: 40, right: 40),
                          child: Text('Continue'),
                        ),
                      ),
                    ],
                  ),
                ])))));
  }

  Container bloc1({required double height}) => Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        width: double.infinity,
        height: height * 0.2,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.arrow_back_ios_new_outlined,
              ),
              Container(
                padding: const EdgeInsets.only(left: 120, right: 20),
                child: const Text(
                  'Remarks',
                  style: (TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      );
}
