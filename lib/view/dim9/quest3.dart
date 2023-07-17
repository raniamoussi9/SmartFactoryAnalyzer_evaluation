import 'package:flutter/material.dart';
import 'package:smart_factory_analyzer/view/dim2/quest4.dart';
import 'package:smart_factory_analyzer/view/dim9/quest4.dart';

import '../welcome_page.dart';

class Quest3dim9 extends StatelessWidget {
  const Quest3dim9({super.key});

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
        title: Text('Assessment 9'),
      ),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.1),
          Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Describe and elaborate the type of communication protocol implemented in the equipment, machinery and computer-based systems (e.g. flied bus , industrial ethernet, transmission control protocol, Internet protocol (TCP/IP),etc.)',
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
            MaterialPageRoute(builder: (context) => Quest4dim9()),
          );
        },
        child: Icon(Icons.arrow_forward),
      ),
    ));
  }
}