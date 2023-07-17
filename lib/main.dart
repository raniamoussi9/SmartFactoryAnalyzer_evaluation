

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_factory_analyzer/controller/login.dart';
import 'package:smart_factory_analyzer/view/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
  providers:  [
    ChangeNotifierProvider<LoginControlller>(create: (_) => LoginControlller()),
    //Provider<SomethingElse>(create: (_) => SomethingElse()),
    //Provider<AnotherThing>(create: (_) => AnotherThing()),
  ],
  child: MyApp(),
)
  );
}


// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});
  Future<FirebaseApp> firebase = Firebase.initializeApp();
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SIRI App',
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
            if (snapshot.hasError) {
              debugPrint(snapshot.error.toString());
            } else if (snapshot.connectionState == ConnectionState.done) {
              return  const Splash();
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}