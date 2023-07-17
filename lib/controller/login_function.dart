import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_factory_analyzer/controller/login.dart';
import 'package:smart_factory_analyzer/view/dashboard.dart';

Future<void> signIn(
    String username, String password, BuildContext context) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final LoginControlller provider =
      Provider.of<LoginControlller>(context, listen: false);

  try {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('user')
        .where('nom', isEqualTo: username)
        .get();
    if (querySnapshot.size == 1) {
      // If there is exactly one document that matches the query, authenticate the user
      DocumentSnapshot documentSnapshot = querySnapshot.docs[0];
      Map<String, dynamic> agentData =
          documentSnapshot.data() as Map<String, dynamic>;

      if (agentData['password'] == password) {
        prefs.setBool('isConnected', true).then((value) {
          provider.setUserName(agentData['nom']);
          print(agentData);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
            return Dashboard();
          }));
        });
      } else {
        Fluttertoast.showToast(
            backgroundColor: Colors.red,
            msg: 'Incorrect password',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } else if (querySnapshot.size == 0) {
      Fluttertoast.showToast(
          backgroundColor: Colors.red,
          msg: 'No user found for that email',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  } catch (e) {
    debugPrint('Error signing in:');
    Fluttertoast.showToast(
        backgroundColor: Colors.red,
        msg: 'No user found for that email',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
