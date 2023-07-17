// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element

import 'package:flutter/material.dart';
import 'package:smart_factory_analyzer/view/dim7/band7.dart';

Color myColor = Color.fromARGB(255, 36, 36, 93);
Color myColor2 = Color.fromRGBO(49, 195, 231, 1);
Color myColor3 = Color.fromRGBO(167, 202, 240, 1);
Color myColor4 = Color.fromRGBO(32, 32, 69, 1);

class Band6 extends StatefulWidget {
  @override
  _Band6State createState() => _Band6State();
}

class _Band6State extends State<Band6> {
  int selectedProposition = -1;

  List<String> propositions = [
    "0. None",
    "1. Basic",
    "2. Advanced",
    "3. Full",
    "4. Flexible",
    "5. Converged"
  ];

  List<String> definitions = [
    "Facility processes are not automated; Facility processes are executed by humans.",
    "Facility processes are partially automated, with significant human intervention; Facility processes are executed by humans, with the assistance of equipment, machinery and computer-based systems.",
    "Facility processes are automated, with minimal human intervention; Facility processes are predominantly executed by equipment, machinery and computer-based systems. Human intervention is required to initiate and conclude each process.",
    "Facility processes are fully automated, with no human intervention; Facility processes are fully automated through the utilization of equipment, machinery and computer-based systems. Human intervention is required for unplanned events.",
    "Automated facility processes are adaptable; Equipment, machinery and computer-based systems can easily be modified, reconfigured and re-tasked quickly and easily. Limited human intervention is required for unplanned events.",
    "Flexible facility processes are converged with shop floor and enterprise automation platforms to form highly autonomous networks; Equipment, machinery and computer-based systems are flexible and formally integrated with shop floor and enterprise systems to allow for dynamic, cross-domain interactions."
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
            'Facility Automation is the application of technology to monitor, control and execute processes within the physical building and/or premises where the production area is located. These processes include but are not limited to the management of HVAC, chiller, security and lighting systems.',
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
                    text: 'DIMENSION 6\n',
                    style: TextStyle(fontSize: 20, color: Colors.black)),
                TextSpan(
                    text: 'Technology – Automation - Facility Automation',
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
              MaterialPageRoute(builder: (context) => Band7()),
            );
          },
          child: Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}
