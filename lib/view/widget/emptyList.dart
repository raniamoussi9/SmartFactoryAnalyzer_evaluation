import 'package:flutter/material.dart';
import 'package:smart_factory_analyzer/core/app_const.dart';
import 'package:smart_factory_analyzer/core/const.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: ConstVariable.getHeight(context)*0.1,horizontal: 20),
      color: Colors.transparent,
      alignment: Alignment.center,
      height: ConstVariable.getWidth(context) * 0.5,
      width: ConstVariable.getWidth(context) * 0.5,
      child: Column(children: [
        Image.asset("images/emptyPic.png"),
        SizedBox(
          height: 10,
        ),
        Text("empty List ,\nif you want you can creat new element")
      ]),
    );
  }
}
