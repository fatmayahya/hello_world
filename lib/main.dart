import 'package:flutter/material.dart';
//my first app in flutter
import 'WelcomeScreen.dart';
import 'HomeScreen.dart';
import 'LogInScreen.dart';
import 'SignUpScreen.dart';

void main() {
  runApp(CodeWithME());
}

class CodeWithME extends StatefulWidget {
  @override
  State<CodeWithME> createState() => _CodeWithMEState();
}

class _CodeWithMEState extends State<CodeWithME> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Code With ME',
      theme: ThemeData(primarySwatch: Colors.lightGreen),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        LogInScreen.id: (context) => LogInScreen(),
        SignUpScreen.id: (context) => SignUpScreen(),
      },
//HomeScreen

    /*
    *
    *
    * */
    );
  }
}
