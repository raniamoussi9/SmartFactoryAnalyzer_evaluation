import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_factory_analyzer/controller/login.dart';
import 'package:smart_factory_analyzer/view/company_details.dart';
import 'package:smart_factory_analyzer/view/dashboard.dart';
import 'package:smart_factory_analyzer/view/login_page.dart';

import '../model/Indus.dart';

class CompanyPrograss extends StatefulWidget {
  const CompanyPrograss({super.key,required this.progress,required this.name});
  final double progress;
  final String name;

  

  @override
  State<StatefulWidget> createState() => CompanyPrograssState();
}

var b = const Color.fromRGBO(255, 255, 255, 1);
Color myColor = Color.fromARGB(255, 36, 36, 93);

class CompanyPrograssState extends State<CompanyPrograss> {
  

  final controller = TextEditingController();
  List<Indus> induss = allIndus;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.height;
    return Scaffold(
        
        body: SafeArea(
      child: Container(
        height: screenHeight,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              bloc1(height: screenHeight, width: screenWidth),
              const SizedBox(
                height: 10,
              ),
              bloc2(),
              const SizedBox(
                height: 10,
              ),
              bloc3(screenHeight: screenHeight, screenWidth: screenWidth,text: "operaion-vertical",value: Random().nextDouble()),
              bloc3(screenHeight: screenHeight, screenWidth: screenWidth,text: "supply chain", value: Random().nextDouble()),
              bloc3(screenHeight: screenHeight, screenWidth: screenWidth,text: "product lifecycle",value: Random().nextDouble()),
              bloc3(screenHeight: screenHeight, screenWidth: screenWidth,text: "Automation",value: Random().nextDouble()),
              bloc3(screenHeight: screenHeight, screenWidth: screenWidth,text: "connectivity",value: Random().nextDouble()),
              bloc3(screenHeight: screenHeight, screenWidth: screenWidth,text: "intelligence", value: Random().nextDouble()),
              bloc3(screenHeight: screenHeight, screenWidth: screenWidth,text: "talent readinnes leadership",value: Random().nextDouble()),
              bloc3(screenHeight: screenHeight, screenWidth: screenWidth,text: "structure & management",value:Random().nextDouble()),
              bloc3(screenHeight: screenHeight, screenWidth: screenWidth,text: "stategy and governance",value: Random().nextDouble()),
              
            ],
          ),
        ),
      ),
    ));
  }

  Container bloc3({required double screenHeight, required double screenWidth,required double value,required String text}) {
    return Container(
      margin: EdgeInsets.only(
          left: screenWidth * 0.03,
          top: screenHeight * 0.015,
          right: screenWidth * 0.03,
          bottom: screenHeight * 0.015),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromRGBO(167, 202, 240, 1),
      ),
      width: screenWidth,
      height: screenHeight * 0.2,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                Text(
                  text,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const Text('designation')
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(top: 35, bottom: 20),
              child: const Text(
                'Assesment Progress',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            LinearProgressIndicator(
              backgroundColor: const Color.fromRGBO(150, 226, 242, 1),
              value: value,
              color: const Color.fromRGBO(36, 36, 93, 1),
            ),
          ],
        ),
      ),
    );
  }

  Widget bloc2() {
    //SingleChildScrollView(
    // scrollDirection: Axis.horizontal,
    //padding: const EdgeInsets.all(10),

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: ["all", "Designation 1", "Designation 2", "Designation 3", "Designation 4"]
            .map(
              (e) => Container(
                
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton(
                  onPressed: () => setState(() {}),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: Text(e.toString()),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Container bloc1({required double height, required double width}) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
        color: Color.fromARGB(255, 36, 36, 93),
      ),
      width: width,
      height: height * 0.29,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical:10.0,horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10,),
         Row(
          mainAxisAlignment: MainAxisAlignment.start,
           children: [
            IconButton(onPressed: (){Navigator.pushReplacement(context,MaterialPageRoute(builder: (context){
              return Dashboard();
            }));}, icon: Icon(Icons.arrow_back,color: Colors.white,)),
            Spacer(flex: 1,),
             Text(widget.name,style: TextStyle(color: Colors.white,fontSize: 20),),
             Spacer(flex: 2,),
           ],
         ),
          Center(child: Text((widget.progress*100).toString()+"%",style:  TextStyle(fontSize: height*0.08,color: Colors.white,fontWeight: FontWeight.bold),)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            ElevatedButton(onPressed: (){}, child: Text("Contact",style: TextStyle(color: Colors.black),),style: ElevatedButton.styleFrom(backgroundColor: Colors.white,fixedSize: Size(width*0.2, 30))),
            SizedBox(width: width*0.015,),
            ElevatedButton(onPressed: (){}, child: Text("Details"),style: ElevatedButton.styleFrom(backgroundColor: Color.fromRGBO(49, 195, 231, 1),fixedSize: Size(width*0.2, 30))),
          ],)
         
        ]),
      ),
    );
  }

  void searchinduss(String query) {
    final suggestions = allIndus.where((indus) {
      final industitle = indus.title.toLowerCase();
      final input = query.toLowerCase();
      return industitle.contains(input);
    }).toList();

    setState(() => induss = suggestions);
  }
}
