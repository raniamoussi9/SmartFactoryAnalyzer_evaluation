// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element

import 'package:flutter/material.dart';
import 'package:smart_factory_analyzer/core/app_const.dart';
import 'package:smart_factory_analyzer/view/dim1/ques1.dart';


Color myColor = Color.fromARGB(255, 36, 36, 93);
Color myColor2 = Color.fromRGBO(49, 195, 231, 1);
Color myColor3 = Color.fromRGBO(167, 202, 240, 1);
Color myColor4 = Color.fromRGBO(32, 32, 69, 1);

class Band1 extends StatefulWidget {
  @override
  _Band1State createState() => _Band1State();
}

class _Band1State extends State<Band1> {
  int selectedProposition = -1;

  List<String> propositions = [
    "0. Undefined",
    "1. Defined",
    "2. Digital",
    "3. Integrated",
    "4. Automated",
    "5. Intelligent"
  ];

  List<String> definitions = [
    "Vertical processes are not explicitly defined; Resource planning and technical production processes are managed and executed in silos, based on informal or ad-hoc methods.",
    "Vertical processes are defined and executed by humans, with the support of analogue tools; Resource planning and technical production processes are managed and executed in silos, based on a set of formally-defined instructions.",
    "Defined vertical processes are completed by humans with the support of digital tools; Resource planning and technical production processes are managed and executed in silos, by Operational Technology (OT) and Information Technology (IT) systems.",
    "Digitized vertical processes and systems are securely integrated across all hierarchical levels of the automation pyramid; OT and IT systems managing resource planning and technical production processes are formally linked. However, the exchange of data and information across different functions is predominantly managed by humans.",
    "Integrated vertical processes and systems are automated, with limited human intervention; OT and IT systems managing resource planning and technical production processes are formally linked. This enables the exchange of data across different functions that is predominantly executed by equipment, machinery and computer-based systems.",
    "Automated vertical processes and systems are actively analyzing and reacting to data; OT and IT systems are integrated from end-to-end, with processes being optimized through insights generated from the analysis of data."
  ];

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

  void _selectProposition(int index) {
    setState(() {
      selectedProposition = index;
    });
  }

  void _saveSelection() {
    if (selectedProposition != -1) {
      print('Proposition sélectionnée : ${propositions[selectedProposition]}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
              Navigator.pop(context);
            },
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: 'DIMENSION 1\n',
                    style: TextStyle(fontSize: 20, color: Colors.black)),
                TextSpan(
                    text: 'Process – Operations – Vertical Integration',
                    style: TextStyle(fontSize: 13, color: Colors.black))
              ])),
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
          ),
        ),
        body: ListView.separated(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.08),
          itemCount: propositions.length,
          separatorBuilder: (context, index) =>
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: myColor,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.height * 0.05),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(2))),
                    tileColor: myColor4,
                    textColor: Colors.white,
                    iconColor: Colors.white,
                    title: Text(propositions[index],style: TextStyle(fontSize: 16),),
                    contentPadding: EdgeInsets.all(2),
                    /*leading: Radio(
                      focusColor: Colors.white,
                      value: index,
                      groupValue: selectedProposition,
                      onChanged: (int? value) {
                        _selectProposition(index);
                        _saveSelection();
                      },
                    ),*/
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
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      width: MediaQuery.of(context).size.width ,
                      color: myColor4,
                      child: Center(
                        child: Text(
                          definitions[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                              fontSize: 10.5),
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
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Question1Dim1()),
            );
          },
          child: Icon(Icons.arrow_forward,color: AppConst.backgroundBlueColor,),
        ),
      ),
    );
  }
}
