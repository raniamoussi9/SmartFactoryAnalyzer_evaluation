// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element

import 'package:flutter/material.dart';
import 'package:smart_factory_analyzer/view/dim14/band14.dart';

Color myColor = Color.fromARGB(255, 36, 36, 93);
Color myColor2 = Color.fromRGBO(49, 195, 231, 1);
Color myColor3 = Color.fromRGBO(167, 202, 240, 1);
Color myColor4 = Color.fromRGBO(32, 32, 69, 1);

class Band13 extends StatefulWidget {
  @override
  _Band13State createState() => _Band13State();
}

class _Band13State extends State<Band13> {
  int selectedProposition = -1;

  List<String> propositions = [
    "0. Informed",
    "1. Structured",
    "2. Continuous",
    "3. Integrated",
    "4. Adaptive",
    "5. Forward-looking"
  ];

  List<String> definitions = [
    "Informal mentorship and apprenticeship is the predominant mode of workforce L&D; There is no formal L&D curriculum to on-board and train the workforce.",
    "Formally-designed training curricula for skills acquisition is the predominant mode of workforce L&D; There is a formal L&D curriculum with clear commencement and conclusion points. The scope of L&D is limited to skills acquisition.",
    "Structured L&D programmes are designed to run on an ongoing basis, to order to enable the ongoing enhancement and/or expansion of employees’ skillsets; There is a structured L&D curriculum that adopts an approach of continuous to enable the constant learning, re-learning and improvement of new and existing skills.",
    "Continuous L&D programmes are formally aligned with the organization’s business needs and human resources (HR) functions; There is a continuous L&D curriculum that is integrated with organizational objectives, talent attraction and career development pathways.",
    "Integrated L&D programmes are actively developed, refreshed and customized based on insights provided by key stakeholders through feedback loops; Formal feedback channels are in place to allow integrated L&D programmes to be jointly curated and updated by employees, HR and business teams.",
    "Active efforts are made to identify and incorporate innovative L&D practices and training for future skillsets into the adaptive L&D programmes; There are proactive steps to incorporate requirements for future skillsets and novel L&D methodologies into existing L&D programmes."
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
            'Workforce Learning & Development (“L&D”) is a system of processes and programmes that aims to develop the workforce’s capabilities, skills and competencies to achieve organizational excellence.',
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
                    text: 'DIMENSION 13\n',
                    style: TextStyle(fontSize: 20, color: Colors.black)),
                TextSpan(
                    text: 'Organization – Talent Readiness – Workforce Learning & Development',
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
              MaterialPageRoute(builder: (context) => Band14()),
            );
          },
          child: Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}
