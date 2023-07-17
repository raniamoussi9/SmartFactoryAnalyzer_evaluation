// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:smart_factory_analyzer/view/dim2/quest2.dart';
import 'package:smart_factory_analyzer/view/dim7/quest2.dart';

import '../welcome_page.dart';

class Quest1dim7 extends StatelessWidget {
  const Quest1dim7({super.key});

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
        title: Text('Assessment 7'),
      ),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.1),
          Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'How does the shop floor team collect and retrieve shop floor data (e.g. downtime, quality, maintenance, machine availability, etc.)',
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
            MaterialPageRoute(builder: (context) => Quest2dim7()),
          );
        },
        child: Icon(Icons.arrow_forward),
      ),
    ));
  }
}