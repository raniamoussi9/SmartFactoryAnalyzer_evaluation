import 'package:flutter/material.dart';
import 'package:smart_factory_analyzer/view/dim2/quest5.dart';
import 'package:smart_factory_analyzer/view/dim8/quest5.dart';

import '../welcome_page.dart';

class Quest4dim8 extends StatelessWidget {
  const Quest4dim8({super.key});

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
                'Describe and elaborate the security protocols (e.g. VPN, firewall, DMZ, etc.) implemented in computer-based systems?',
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
            MaterialPageRoute(builder: (context) => Quest5dim8()),
          );
        },
        child: Icon(Icons.arrow_forward),
      ),
    ));
  }
}