import 'package:flutter/material.dart';
import 'package:smart_factory_analyzer/view/dim14/quest4.dart';

import '../welcome_page.dart';

class Quest3dim14 extends StatelessWidget {
  const Quest3dim14({super.key});

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
        title: const Text('Assessment 14'),
      ),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.1),
          const Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'How does the management team identify and implement the Industry 4.0 concepts and technologies in the company ?',
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
            MaterialPageRoute(builder: (context) => const Quest4dim14()),
          );
        },
        child: const Icon(Icons.arrow_forward),
      ),
    ));
  }
}