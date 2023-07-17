import 'package:flutter/material.dart';
import 'package:smart_factory_analyzer/view/dim2/quest3.dart';
import 'package:smart_factory_analyzer/view/dim5/quest3.dart';

import '../welcome_page.dart';

class Quest2dim5 extends StatelessWidget {
  const Quest2dim5({super.key});

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
        title: Text('Assessment 5'),
      ),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.1),
          Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'How does the entreprise team monitor, control and execute the entreprise processes (e.g. accounts, sales, marketing, inventory management, human resource, etc.)? please describe the computerbased systems used.',
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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Quest3dim5()),
          );
        },
        child: Icon(Icons.arrow_forward),
      ),
    ));
  }
}