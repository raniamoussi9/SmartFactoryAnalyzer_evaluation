// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element

import 'package:flutter/material.dart';
import 'package:smart_factory_analyzer/view/fin_dim.dart';

Color myColor = Color.fromARGB(255, 36, 36, 93);
Color myColor2 = Color.fromRGBO(49, 195, 231, 1);
Color myColor3 = Color.fromRGBO(167, 202, 240, 1);
Color myColor4 = Color.fromRGBO(32, 32, 69, 1);

class Band16 extends StatefulWidget {
  @override
  _Band16State createState() => _Band16State();
}

class _Band16State extends State<Band16> {
  int selectedProposition = -1;

  List<String> propositions = [
    "0. None",
    "1. Formalization",
    "2. Development",
    "3. Implementation",
    "4. Scaling",
    "5. Adaptive"
  ];

  List<String> definitions = [
    "Transformation towards a Factory/Plant-of-the-Future is not present in any part of the organization’s strategy; Intentions to establish a Factory/Plant-of-the-Future are not identified as a strategic focus in the company’s current or future plans.",
    "Transformation towards a factory/plant-of-the-future has been formally identified as a business strategy at the corporate or business level; Intentions to establish a factory/plant-of-the-future has been identified as a strategic focus in the company’s current or future operations.",
    "A transformation initiative towards a factory/plant-of-the-future is being/has been developed by a dedicated team; A long-term strategy and governance model that establishes a factory/plant-of-the-future is being/has been developed.",
    "Transformation initiative towards a Factory/Plant-of-the-Futurehas been formally implemented in at least one functional area; The long-term strategy and governance model to establish a Factory/Plant-of the-Future has been put into action.",
    "Transformation initiative towards a Factory/Plant-of-the-Future is expanded to include more than one functional area; A long-term strategy and governance model to establish a Factory/Plant-of-the-Future is scaled up to include secondary areas.",
    "Transformation initiative towards a Factory/Plant-of- the-Future is refreshed and updated dynamically; The long-term strategy and governance model to establish a Factory/Plant-of-the-Future is constantly reviewed and dynamically refreshed to account for the latest advancements in technology, business philosophy and practices."
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
            'Strategy and governance is the design and execution of a plan of action to achieve a set of long-term goals. It includes identifying priorities, formulating a roadmap and developing a system of rules, practices and processes to translate a vision into business value.',
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
                    text: 'DIMENSION 16\n',
                    style: TextStyle(fontSize: 20, color: Colors.black)),
                TextSpan(
                    text: 'Organization – Structure & Management – Strategy and Governance',
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
              MaterialPageRoute(builder: (context) => lastdimension()),
            );
          },
          child: Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}
