import 'package:flutter/material.dart';
import 'package:smart_factory_analyzer/view/dim13/quest1.dart';
import 'package:smart_factory_analyzer/view/dim14/quest1.dart';
import 'package:smart_factory_analyzer/view/dim3/quest1.dart';

import '../welcome_page.dart';

class Quest6dim13 extends StatelessWidget {
  const Quest6dim13({super.key});

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
        title: Text('Assessment 13'),
      ),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.1),
          Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'How is the learning and development curriculum being constantly revised based on the latest technology trends?',
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
            MaterialPageRoute(builder: (context) => Quest1dim14()),
          );
        },
        child: Icon(Icons.arrow_forward),
      ),
    ));
  }
}