// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_factory_analyzer/controller/dimension_controller.dart';
import 'package:smart_factory_analyzer/core/all_the_dimentions_questions.dart';
import 'package:smart_factory_analyzer/view/company_prograss.dart';
import 'package:smart_factory_analyzer/view/dim1/band1.dart';

class Question1Dim1 extends StatefulWidget {
  const Question1Dim1({super.key, required this.index});
  final int index;

  @override
  State<Question1Dim1> createState() => _Question1Dim1State();
}

class _Question1Dim1State extends State<Question1Dim1> {
  late TextEditingController controller;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DimensionController provider = Provider.of<DimensionController>(context);
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
            Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CompanyPrograss(
                               
                              )),
                    );
          },
        ),
        centerTitle: true,
        title: Text(
          'Assessment ${provider.questionIndex + 1}',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                (dimensionInputModel[widget.index]
                    .questions)[provider.questionIndex],
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                controller: controller,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.white),
                  labelStyle: TextStyle(color: Colors.grey.withOpacity(0.6)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  labelText: 'Answer',
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          DimensionController provider =
              Provider.of<DimensionController>(context, listen: false);
          print(widget.index);
          if (provider.questionIndex <
              ((dimensionInputModel[widget.index].questions).length - 1)) {
            provider.addDim(controller.text);
            controller.clear();
            provider.incrementQuestionIndex();
            print(provider.questionIndex);
          } else {
            provider.addDim(controller.text);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => Band1(index: widget.index)),
            );

            controller.clear();
            print(provider.dimResponse);
          }
        },
        child: Icon(Icons.arrow_forward),
      ),
    ));
  }
}
