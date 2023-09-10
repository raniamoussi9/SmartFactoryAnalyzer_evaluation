import 'package:flutter/material.dart';
import 'package:smart_factory_analyzer/view/dim2/quest3.dart';
import 'package:smart_factory_analyzer/view/dim8/quest3.dart';

import '../welcome_page.dart';

class Quest2dim8 extends StatelessWidget {
  const Quest2dim8({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: myColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Assessment 8'),
      ),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.1),
          Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'How do computer -based systems exchange information between the different enterprise processes (e.g. sales order, demand forecast , product specification, purchase order, supply chain planning, etc.)?',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.1),
          Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Answer',
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Quest3dim8()),
          );
        },
        child: Icon(Icons.arrow_forward),
      ),
    ));
  }
}