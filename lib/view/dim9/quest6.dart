import 'package:flutter/material.dart';
import 'package:smart_factory_analyzer/view/dim10/quest1.dart';
import 'package:smart_factory_analyzer/view/dim3/quest1.dart';
import 'package:smart_factory_analyzer/view/remarks.dart';

import '../dim10/band10.dart';

class Quest6dim9 extends StatelessWidget {
  const Quest6dim9({super.key});

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
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'How does the existing network reconfigure and accommodate any modifications made to the equipment, machinery and existing computer-based systems?',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
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
            MaterialPageRoute(builder: (context) => Remarks(path: Band10())),
          );
        },
        child: Icon(Icons.arrow_forward),
      ),
    ));
  }
}
