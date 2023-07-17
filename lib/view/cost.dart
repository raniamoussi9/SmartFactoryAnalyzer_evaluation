import 'package:flutter/material.dart';

class Cost extends StatefulWidget {
  const Cost({super.key});

  @override
  State<StatefulWidget> createState() => CostState();
}

class CostState extends State<Cost> {
  var arrData = [
    'Aftermarket Services/ Warranty',
    'Depreciation',
    'Labor',
    'Maintenance & Repair',
    'Raw Materials & Consumables',
    'Rental & Development',
    'Selling, Genral & AdministrativeExpense(“SG&A”)',
    'Transportation & Distribution',
    'Utilities'
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: SafeArea(
      child: Container(
        height: screenHeight,
        color: const Color.fromRGBO(36, 36, 93, 1),
        child: SingleChildScrollView(
          child: Column(
            children: [
              bloc1(height: screenHeight),
              bloc2(screenHeight: screenHeight),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(150, 226, 242, 1),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: const Text('Next'),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Column bloc2({required double screenHeight}) {
    //el mochkla lena ya sou fel bloc 2+

    return Column(
      children: [
        SizedBox(
          height: screenHeight,
          child: ListView(
              children: arrData.map((value) {
            return Text(value);
          }).toList()),
        ),
        Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(32, 32, 69, 1),
            borderRadius: BorderRadius.circular(21),
          ),
          child: const Text('0%'),
        )
      ],
    );
  }

  Container bloc1({required double height}) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      width: double.infinity,
      height: height * 0.2,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              Icons.arrow_back_ios_new_outlined,
            ),
            Container(
              padding: const EdgeInsets.only(left: 90, right: 20),
              child: const Text(
                'Cost Categories',
                style: (TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
