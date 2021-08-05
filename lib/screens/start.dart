import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'FinalUserProfile.dart';

class Start extends StatefulWidget {
  Start({this.title});
  final String title;

  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:Text(widget.title),
          backgroundColor: Colors.white,
        ),
        body:
        Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assests/one.jpg"),
                  fit: BoxFit.cover)),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              Image.asset("assests/ee.png",alignment: Alignment.center),
              Text(" "),
              Text(" "),
              Text("Welcome to eDrive",style:TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold,color:Colors.white),),
              Text(" "),
              Text("Get your License Online",style:TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color:Colors.white70),),
            ],
          ),
        ),


        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          child: Icon(Icons.arrow_forward_ios),
          onPressed: (){
         //   Navigator.of(context).push(MaterialPageRoute(
            //  builder:(_){
             //   return Home();
           //   },
          //  ));
            Navigator.of(context).pushNamed('/home');
          },
        ),
      ),
    );
  }
}

