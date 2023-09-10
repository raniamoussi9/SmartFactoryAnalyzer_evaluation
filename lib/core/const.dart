import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ConstVariable {
  
  static double getWidth (BuildContext context){ 
return MediaQuery.of(context).size.width;
  }
  static double getHeight (BuildContext context){ 
return MediaQuery.of(context).size.height;
  }
  static Center inputFiled(
      {required BuildContext context,
      required String hintText,
      required TextEditingController controller}) {
    return Center(
      child: Padding(
          padding: EdgeInsets.only(
              top: ConstVariable.getHeight(context) * 0.015,
              left: ConstVariable.getWidth(context) * 0.02,
              right: ConstVariable.getWidth(context) * 0.02),
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


class PercentageInputField extends StatelessWidget {
  final String labelText;

  const PercentageInputField({required this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelStyle: TextStyle(color: const Color.fromARGB(255, 119, 115, 115)),
        labelText: labelText,
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
    );
  }
}