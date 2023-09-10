import 'package:flutter/material.dart';
import 'package:smart_factory_analyzer/view/dim11/quest4.dart';

import '../welcome_page.dart';

class Quest3dim11 extends StatelessWidget {
  const Quest3dim11({super.key});

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
        title: const Text('Assessment 11'),
      ),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.1),
          const Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'How do the computer-based systems notify the relevant personnel parameter when there is parameter diviation, and provide information on the possible causes ?',
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
            MaterialPageRoute(builder: (context) => const Quest4dim11()),
          );
        },
        child: const Icon(Icons.arrow_forward),
      ),
    ));
  }
}