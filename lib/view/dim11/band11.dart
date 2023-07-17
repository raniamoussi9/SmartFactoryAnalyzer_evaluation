// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element

import 'package:flutter/material.dart';
import 'package:smart_factory_analyzer/view/dim12/band12.dart';

Color myColor = Color.fromARGB(255, 36, 36, 93);
Color myColor2 = Color.fromRGBO(49, 195, 231, 1);
Color myColor3 = Color.fromRGBO(167, 202, 240, 1);
Color myColor4 = Color.fromRGBO(32, 32, 69, 1);

class Band11 extends StatefulWidget {
  @override
  _Band11State createState() => _Band11State();
}

class _Band11State extends State<Band11> {
  int selectedProposition = -1;

  List<String> propositions = [
    "0. None",
    "1. Computerized",
    "2. Visible",
    "3. Diagnostic",
    "4. Predictive",
    "5. Adaptive"
  ];

  List<String> definitions = [
    "Enterprise systems are not in use; No electronic or digital devices are used and alerts are identified purely based on human capabilities.",
    "Enterprise IT systems execute pre-programmed tasks and processes; Enterprise computer-based systems perform tasks based on pre-programmed logic.",
    "Enterprise IT systems are able to identify deviations; Enterprise computer-based systems are able to notify relevant personnel of deviations from pre-defined parameters.",
    "Enterprise IT systems are able to identify deviations and diagnose potential causes; Enterprise computer-based systems are able to notify relevant personnel of deviations and provide information on the possible causes.",
    "Enterprise IT systems are able to diagnose problems and predict future states of assets and systems; Enterprise computer-based systems are able to predict and notify relevant personnel of potential deviations and provide information onthe possible causes.",
    "Enterprise IT systems are able to diagnose problems, predict future states, and autonomously execute decisions to adapt to changes; Enterprise computer-based systems are able to predict and diagnose potential deviations, and independently execute decisions to optimize performance and resource efficiency."
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
            'Enterprise Intelligence is the processing and analysis of data to optimize existing administrative processes and create new applications, products and services.',
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
        backgroundColor: myColor,
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
                    text: 'DIMENSION 11\n',
                    style: TextStyle(fontSize: 20, color: Colors.black)),
                TextSpan(
                    text: 'Technology – Intelligence – Entreprise Intelligence',
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
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.height * 0.05),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(2))),
                    tileColor: myColor4,
                    textColor: Colors.white,
                    iconColor: Colors.white,
                    title: Text(propositions[index]),
                    contentPadding: EdgeInsets.all(2),
                    leading: Radio(
                      focusColor: Colors.white,
                      value: index,
                      groupValue: selectedProposition,
                      onChanged: (int? value) {
                        _selectProposition(index);
                        _saveSelection();
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
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      width: MediaQuery.of(context).size.width * 0.88,
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Band12()),
            );
          },
          child: Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}
