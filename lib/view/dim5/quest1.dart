// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:smart_factory_analyzer/view/dim2/quest2.dart';
import 'package:smart_factory_analyzer/view/dim5/quest2.dart';

import '../welcome_page.dart';

class Quest1dim5 extends StatelessWidget {
  const Quest1dim5({super.key});

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
                'Describe the degree and flexibility of automation within the location where the administrative work is carried out. Exampled of administrative work are saled and marketing, demand planning, procurement, human resource management and planning.',
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
            MaterialPageRoute(builder: (context) => Quest2dim5()),
          );
        },
        child: Icon(Icons.arrow_forward),
      ),
    ));
  }
}