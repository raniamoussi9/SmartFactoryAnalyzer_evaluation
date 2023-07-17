// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:smart_factory_analyzer/view/dim16/quest2.dart';
import 'package:smart_factory_analyzer/view/dim2/quest2.dart';

import '../welcome_page.dart';

class Quest1dim16 extends StatelessWidget {
  const Quest1dim16({super.key});

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
        title: Text('Assessment 16'),
      ),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.1),
          Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Does the company have the intention to establish a factory/ Plant- ofthe-Future ? is it identified as part of the organization’s startegy ?',
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
            MaterialPageRoute(builder: (context) => Quest2dim16()),
          );
        },
        child: Icon(Icons.arrow_forward),
      ),
    ));
  }
}