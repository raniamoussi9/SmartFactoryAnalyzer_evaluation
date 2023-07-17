import 'package:flutter/foundation.dart';
import 'package:smart_factory_analyzer/view/company_details_page_input2.dart';
import 'package:smart_factory_analyzer/view/dashboard.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CompanyDetailsPageInput1 extends StatefulWidget {
  const CompanyDetailsPageInput1({super.key});

  @override
  State<CompanyDetailsPageInput1> createState() => _CompanyDetailsPageInput1State();
}

class _CompanyDetailsPageInput1State extends State<CompanyDetailsPageInput1> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  final TextEditingController _controller5 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final double screenHight = MediaQuery.of(context).size.height;
    final double screenWidht = MediaQuery.of(context).size.width;
    final pages = List.generate(
        3,
        (index) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade300,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
              child: SizedBox(
                height: 50,
                child: Center(
                    child: Text(
                  "Page $index",
                  style: const TextStyle(color: Colors.indigo),
                )),
              ),
            ));
    /****************************************** */
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 36, 36, 93),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        toolbarHeight: screenHight * 0.15,
        elevation: 14,
        title: Center(
            child: Text(
          'Company Details',
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        )),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20))),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return const Dashboard();
            }));
          },
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 35),
            child: Text(
              'Please fill in the form to continue',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
          )),
          inputFiled(
              screenHight: screenHight,
              screenWidht: screenWidht,
              controller: _controller1,
              hintText: "industry group"),
          inputFiled(
              screenHight: screenHight,
              screenWidht: screenWidht,
              controller: _controller2,
              hintText: "Company Category"),
          inputFiled(
              screenHight: screenHight,
              screenWidht: screenWidht,
              controller: _controller3,
              hintText: "currency"),
              
              
          SizedBox(
            height: screenHight * 0.2,
          ),
          Row(
            children: [
              Padding(
                  padding: EdgeInsets.only(
                      left: screenWidht * 0.02, top: screenHight * 0.012),
                  child: SmoothPageIndicator(
                    controller: controller,
                    count: pages.length,
                    effect: const WormEffect(
                      dotHeight: 10,
                      dotWidth: 10,
                      type: WormType.thinUnderground,
                    ),
                  )),
              const Spacer(),
              Padding(
                  padding: EdgeInsets.only(
                      left: screenWidht * 0.02, top: screenHight * 0.012),
                  child: Ink(
                    width: 60,
                    height: 60,
                    decoration: const ShapeDecoration(
                        shape: CircleBorder(),
                        color: Color.fromARGB(255, 38, 102, 170)),
                    child: IconButton(
                      icon: const Icon(Icons.chevron_right),
                      iconSize: 24,
                      color: const Color.fromARGB(255, 0, 0, 0),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CompanyDetailsPageInput2()),
                        );
                      },
                    ),
                  )),
              SizedBox(
                width: screenWidht * 0.1,
              )
            ],
          ),
        ],
      ),
    );
  }

  Center inputFiled(
      {required double screenHight,
      required double screenWidht,
      required String hintText,
      required TextEditingController controller}) {
    return Center(
      child: Padding(
          padding: EdgeInsets.only(
              top: screenHight * 0.015,
              left: screenWidht * 0.02,
              right: screenWidht * 0.02),
          child: TextField(
            controller: controller,
            onChanged: (value) {
              if (kDebugMode) {
                print("The value entered is : $value");
              }
            },
            cursorColor: const Color.fromARGB(255, 255, 255, 255),
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintStyle: const TextStyle(
                color: Color.fromARGB(146, 255, 255, 255),
                fontWeight: FontWeight.w300,
                fontSize: 14,
              ),
              hintText: hintText,
              filled: true,
              fillColor: const Color.fromARGB(255, 32, 32, 69),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          )),
    );
  }
}
