import 'package:flutter/material.dart';
import 'package:smart_factory_analyzer/core/app_const.dart';
import 'package:smart_factory_analyzer/core/app_route.dart';

class Messages{
  static Future<void> showExitConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // Dialog cannot be dismissed by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppConst.backgroundBlueColor,
          title: const Text('Exit Confirmation'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want to exit the app?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                // Close the dialog and do nothing
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Exit'),
              onPressed: () {
                // Close the dialog and exit the app
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacementNamed(AppRoute.companyDetailsGlobalPage); // Pop the current screen
              },
            ),
          ],
        );
      },
    );
  }
}