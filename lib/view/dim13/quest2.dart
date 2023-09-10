import 'package:flutter/material.dart';
import 'package:smart_factory_analyzer/view/dim13/quest3.dart';

import '../welcome_page.dart';

class Quest2dim13 extends StatelessWidget {
  const Quest2dim13({super.key});

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
        title: const Text('Assessment 13'),
      ),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.1),
          const Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'How are the training programmes for employees being identified?',
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
            MaterialPageRoute(builder: (context) => const Quest3dim13()),
          );
        },
        child: const Icon(Icons.arrow_forward),
      ),
    ));
  }
}