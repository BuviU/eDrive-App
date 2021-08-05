import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app/screens/writtenExamResults.dart';
import 'screens/Final.dart';
import 'screens/FinalUserProfile.dart';
import 'screens/LCReg.dart';
import 'screens/LearnersCenter.dart';
import 'screens/MCReg.dart';
import 'screens/MedicalCenter.dart';
import 'screens/MyLicence.dart';
import 'screens/PracticalExam.dart';
import 'screens/SignUp.dart';
import 'screens/Training.dart';
import 'screens/WrittenExam.dart';
import 'screens/home.dart';
import 'screens/login.dart';
import 'screens/start.dart';
import 'screens/userProfile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "eDrive",
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: Start(title: "eDrive"),
      routes: <String, WidgetBuilder>{
        '/home': (context) => Home(),
        '/logIn': (context) => LogIn(),
        '/SignUp': (context) => SignUp(),
        '/UserProfile': (context) => UserProfile(),
        '/LearnersCenter': (context) => LearnersCenter(),
        '/LCReg': (context) => LCReg(),
        '/MedicalCenter': (context) => MedicalCenter(),
        '/MCReg': (context) => MCReg(),
        '/WrittenExam': (context) => WrittenExam(),
        '/Training': (context) => Training(),
        '/PracticalExam': (context) => PracticalExam(),
        '/Final': (context) => Final(),
        '/FinalUserProfile': (context) => FinalUserProfile(),
        '/MyLicence': (context) => MyLicence(),
        '/writtenExamResults': (context) => WrittenExamResults(),
        '/Start': (context) => Start(),
      },
    );
  }
}
