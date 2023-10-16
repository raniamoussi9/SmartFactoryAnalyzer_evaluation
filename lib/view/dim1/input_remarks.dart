import 'package:flutter/material.dart';

import '../welcome_page.dart';

class AddRem extends StatefulWidget {
  const AddRem({super.key});

  @override
  State<AddRem> createState() => _AddRemState();
}

class _AddRemState extends State<AddRem> {
  TextEditingController _remarkController = TextEditingController();
  List<String> remarks = [];

  @override
  void dispose() {
    _remarkController.dispose();
    super.dispose();
  }

  void _addRemark() {
    setState(() {
      remarks.add(_remarkController.text);
      _remarkController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: myColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Remarks',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                style: TextStyle(color: Colors.white),
                controller: _remarkController,
                maxLines: null,
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.white),
                  hintText: 'Enter your remark',
                ),
              ),
            ),
          ),
          SizedBox(
            height: 6,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: myColor3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1,
                  vertical: 15),
            ),
            child: Text(
              'Add Remark',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.height * 0.017),
            ),
            onPressed: () {
              _addRemark();
            },
          ),
          Expanded(
            child: Container(
              color: myColor4,
              margin: EdgeInsets.only(
                  top: 15,
                  right: 30,
                  left: 30,
                  bottom: MediaQuery.of(context).size.height * 0.12),
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(
                  color: myColor3,
                ),
                itemCount: remarks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      remarks[index],
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.arrow_forward),
      ),
    ));
  }
}
