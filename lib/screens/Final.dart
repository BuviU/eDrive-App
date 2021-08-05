import 'package:flutter/material.dart';
import 'FinalUserProfile.dart';
import 'package:dio/dio.dart';

class Final extends StatefulWidget {
  Final({this.title});
  final String title;
  @override
  _FinalState createState() => _FinalState();
}

class _FinalState extends State<Final> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assests/wall.jpg"),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              Image.asset("assests/qq.jpg",fit: BoxFit.cover, alignment: Alignment.center),
              Text(" "),
              Text("Woow! You Got It",
                style:TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color:Colors.white),
              ),
              Text(" "),
              Text("Check Your Profile",
                style:TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color:Colors.white),
              ),
              Text(" "),
              Text("Get Your Licence",
                style:TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color:Colors.white),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          child: Icon(Icons.account_box),
          onPressed: (){
            Navigator.of(context).pushNamed('/FinalUserProfile');
          },
        ),
      ),
    );
  }
}

