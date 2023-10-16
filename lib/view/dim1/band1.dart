// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:smart_factory_analyzer/core/app_const.dart';
import 'package:smart_factory_analyzer/view/dim1/remarks.dart';
import 'package:smart_factory_analyzer/view/widget/loading_page.dart';

import '../../controller/dimension_controller.dart';
import '../../core/all_the_dimentions_questions.dart';
import '../company_prograss.dart';

Color myColor2 = Color.fromRGBO(49, 195, 231, 1);
Color myColor3 = Color.fromRGBO(167, 202, 240, 1);
Color myColor4 = Color.fromRGBO(32, 32, 69, 1);

class Band1 extends StatefulWidget {
  final int index;

  const Band1({super.key, required this.index});
  @override
  _Band1State createState() => _Band1State();
}

class _Band1State extends State<Band1> {
  int selectedProposition = -1;

  List<bool> showDefinition = List.generate(6, (index) => false);

  void showMessageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Definition',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          content: Text(
            'Vertical integration is the integration of processes and system across all hierarchical levels of the automation pyramid within a factory/plant to establish a connected, end-to-end data thread.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'OK',
                style: TextStyle(color: myColor3),
              ),
            ),
          ],
        );
      },
    );
  }

  void _toggleDefinition(int index) {
    setState(() {
      showDefinition[index] = !showDefinition[index];
    });
  }

  /*void _saveSelection() {
    if (selectedProposition != -1) {
      print('Proposition sélectionnée : ${propositions[selectedProposition]}');
    }
  }*/

  @override
  Widget build(BuildContext context) {
    DimensionController provider = Provider.of<DimensionController>(context);
    return Visibility(
      visible: !provider.loading,
      replacement: LoadingWidgetForTheApp(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: myColor4,
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                provider.resetQuestionIndex();
                Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CompanyPrograss(
                               
                              )),
                    );
              },
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.info_outline_rounded,
                  color: Colors.black,
                ),
                onPressed: () {
                  showMessageDialog(context);
                },
              ),
            ],
            centerTitle: true,
            title: Text('DIMENSION ${widget.index + 1}',
                style: TextStyle(fontSize: 20, color: Colors.black)),
          ),
          body: ListView.separated(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.08),
            itemCount: (dimensionInputModel[widget.index].bands).length,
            separatorBuilder: (context, index) =>
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: AppConst.backgroundBlueColor,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.height * 0.05),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(2))),
                      tileColor: myColor4,
                      textColor: Colors.white,
                      iconColor: Colors.white,
                      title: Text(
                        (dimensionInputModel[widget.index].bands)[index]
                            .bandName,
                        style: TextStyle(fontSize: 16),
                      ),
                      contentPadding: EdgeInsets.all(2),
                      leading: Radio(
                        focusColor: Colors.white,
                        value: index,
                        groupValue: provider.bandIndex,
                        onChanged: (int? value) {
                          provider.onChangeBandIndex(value!);
                          print(provider.bandIndex);
                          //_saveSelection();
                        },
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          showDefinition[index]
                              ? Icons.keyboard_arrow_up_outlined
                              : Icons.keyboard_arrow_down_outlined,
                        ),
                        onPressed: () {
                          _toggleDefinition(index);
                        },
                      ),
                    ),
                  ),
                  if (showDefinition[index])
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        width: MediaQuery.of(context).size.width * 0.9,
                        color: myColor4,
                        child: Center(
                          child: Text(
                            (dimensionInputModel[widget.index].bands)[index]
                                .description,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                                fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: myColor3,
            onPressed: () {
               if(provider.bandIndex  != -1){
                Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) {
                return Remarks(index: widget.index,);
              }));
               }else{
                
                        Fluttertoast.showToast(
                            backgroundColor: Colors.red,
                            msg: 'choose option',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
               
            },
            child: Icon(
              Icons.arrow_forward,
              color: AppConst.backgroundBlueColor,
            ),
          ),
        ),
      ),
    );
  }
}
