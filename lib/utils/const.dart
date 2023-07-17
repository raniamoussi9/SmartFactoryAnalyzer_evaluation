import 'package:flutter/material.dart';

class ConstVariable {
  static Color colorCompanyDetails = const Color.fromRGBO(45, 197, 229, 1);
  static double getWidth (BuildContext context){ 
return MediaQuery.of(context).size.width;
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