import 'package:flutter/material.dart';
import 'package:smart_factory_analyzer/view/dim11/band11.dart';
import 'package:smart_factory_analyzer/view/dim11/quest1.dart';
import 'package:smart_factory_analyzer/view/dim2/quest6.dart';
import 'package:smart_factory_analyzer/view/remarks.dart';


class Quest5dim10 extends StatelessWidget {
  const Quest5dim10({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: myColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Assessment 10'),
      ),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.1),
          const Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'How does the equipment , machinery and computer - based systems autonomously execute the decision based on the changes in full operating conditions ?',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.1),
          const Center(
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
            MaterialPageRoute(builder: (context) =>  Remarks(path: Band11())),
          );
        },
        child: const Icon(Icons.arrow_forward),
      ),
    ));
  }
}