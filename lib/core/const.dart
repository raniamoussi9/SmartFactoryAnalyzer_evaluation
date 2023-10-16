import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_factory_analyzer/controller/create_company_controller.dart';
import 'package:smart_factory_analyzer/core/app_const.dart';

class ConstVariable {
  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
 static Widget radioElementOfPanning(
      {required String text,
      required int index,
      required BuildContext context,
      required int indexPlanning}) {
    return Container(
      height: ConstVariable.getHeight(context) * 0.09,
      width: ConstVariable.getWidth(context) * 0.9,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      decoration: BoxDecoration(
        color: AppConst.backgroundcolorforradioElment,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 15, color: Colors.white),
          ),
          const Spacer(),
          Checkbox(
            checkColor: Colors.white,
            fillColor: MaterialStateProperty.all(AppConst.colorCompanyDetails),
            value: indexPlanning == index,
            shape: const CircleBorder(),
            onChanged: (bool? value) {
              Provider.of<CreateCompanyController>(context, listen: false)
                  .onChangePlannigHorizon(index);
            },
          )
        ],
      ),
    );
  }
  static Widget radioElement(
      {required String text,
      required int index,
      required BuildContext context,
      required bool isChecked}) {
    return Container(
      height: ConstVariable.getHeight(context) * 0.09,
      width: ConstVariable.getWidth(context) * 0.9,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      decoration: BoxDecoration(
        color: AppConst.backgroundcolorforradioElment,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 15, color: Colors.white),
          ),
          const Spacer(),
          Checkbox(
            checkColor: Colors.white,
            fillColor: MaterialStateProperty.all(AppConst.colorCompanyDetails),
            value: isChecked,
            shape: const CircleBorder(),
            onChanged: (bool? value) {
              Provider.of<CreateCompanyController>(context, listen: false)
                  .onChangeScope(index);
            },
          )
        ],
      ),
    );
  }

  static Widget dateChoose(
      {required DateTime time,
      required BuildContext context,
      required int index}) {
    return Container(
      height: ConstVariable.getHeight(context) * 0.1,
      width: ConstVariable.getWidth(context) * 0.9,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          const Spacer(
            flex: 2,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: AppConst.backgroundcolorforradioElment,
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: Text(
              time.day.toString(),
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: AppConst.backgroundcolorforradioElment,
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: Text(
              time.month.toString(),
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: AppConst.backgroundcolorforradioElment,
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: Text(
              time.year.toString(),
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          const Spacer(),
          GestureDetector(
            child: const Icon(Icons.calendar_month, color: Colors.white),
            onTap: () async {
              var input = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1950),
                  //DateTime.now() - not to allow to choose before today.
                  lastDate: DateTime(2100));
              if (input != null) {
                Provider.of<CreateCompanyController>(context, listen: false)
                    .onChangeDate(index, input);
              } else {
                print("no!!!!!!!!!!!!!");
              }
            },
          ),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }

  static String generateRandomId(int length) {
    final random = Random();
    const characters = 'abcdefghijklmnopqrstuvwxyz0123456789';
    String randomId = '';

    for (int i = 0; i < length; i++) {
      final randomIndex = random.nextInt(characters.length);
      randomId += characters[randomIndex];
    }
    return randomId;
  }

  static Center inputFiled(
      {required BuildContext context,
      required String hintText,
      bool isTHereNext = true,
      required TextEditingController controller}) {
    return Center(
      child: Padding(
          padding: EdgeInsets.only(
              top: ConstVariable.getHeight(context) * 0.015,
              left: ConstVariable.getWidth(context) * 0.02,
              right: ConstVariable.getWidth(context) * 0.02),
          child: TextField(
            textInputAction:
                isTHereNext ? TextInputAction.next : TextInputAction.done,
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
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelStyle: const TextStyle(color: Color.fromARGB(255, 119, 115, 115)),
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
    );
  }
}
