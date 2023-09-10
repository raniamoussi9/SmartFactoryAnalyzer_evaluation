// ignore_for_file: prefer_const_constructors, duplicate_import, prefer_const_literals_to_create_immutables


import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_factory_analyzer/api/login_function.dart';
import 'package:smart_factory_analyzer/view/dashboard.dart';
import 'welcome_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool loading = false;
  @override
  void dispose() {
    _userName.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Scaffold(
            body: Center(
            child: CircularProgressIndicator(),
          ))
        : Scaffold(
            backgroundColor: myColor,
            body: Form(
              //key: GlobalKey(),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.white,
                      height: MediaQuery.of(context).size.height * 0.27,
                      width: MediaQuery.of(context).size.width * 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                              child: Center(
                            child: Image.asset(
                              'images/siri.png',
                              height: MediaQuery.of(context).size.height * 0.17,
                              width: MediaQuery.of(context).size.height * 0.17,
                            ),
                          )),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.17,
                            width: MediaQuery.of(context).size.height * 0.08,
                          ),
                          SizedBox(
                              child: Center(
                            child: Image.asset(
                              'images/novation.png',
                              height: MediaQuery.of(context).size.height * 0.17,
                              width: MediaQuery.of(context).size.height * 0.17,
                            ),
                          )),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width * 1,
                      decoration: BoxDecoration(
                        color: myColor2,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                      child: Center(
                          child: Text(
                        'Welcome Back',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.02),
                      )),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.025),
                      child: Center(
                          child: Text(
                        'Please fill the form to continue',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.018),
                      )),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.14,
                    ),
                    textField(context,
                        controller: _userName, text: "User Name"),
                    textField(context, controller: _password, text: "Password"),
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.06),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: myColor3,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.26,
                              vertical: 22),
                        ),
                        onPressed: () {
                          setState(() {
                            loading = true;
                          });
                          AuthApi.signIn(_userName.text, _password.text, context)
                              .then((value) {
                            setState(() {
                              loading = false;
                            });
                          });
                        },
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }

  Container textField(BuildContext context,
      {required TextEditingController controller, required String text}) {
    return Container(
      decoration: BoxDecoration(
        color: myColor4,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.01,
          horizontal: MediaQuery.of(context).size.width * 0.05),
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.02,
      ),
      child: SizedBox(
        height: 42,
        width: MediaQuery.of(context).size.width * 0.7,
        child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "require";
            }
            // Ajoutez ici la validation du mot de passe
            // Vous pouvez utiliser une expression régulière ou d'autres vérifications
            return null;
          },
          controller: controller,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: text,
            hintStyle: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
