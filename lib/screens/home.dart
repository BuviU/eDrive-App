import 'package:flutter/material.dart';
import 'login.dart';
import 'SignUp.dart';
import 'package:dio/dio.dart';

class Home extends StatefulWidget {
  Home({this.title});
  final String title;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan[700],
          toolbarHeight: 50.0,
        ),

        body: ListView(
          children:<Widget>[
            Container(
              width: double.infinity,
              height: 300.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assests/one.jpg"),
                        fit: BoxFit.cover)),
              child: Column(

                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset("assests/ee.png",alignment: Alignment.center),
                    Text(""),
                    Text("Get your License Online",style:TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color:Colors.white70),),
                  ]
              ),
            ),
            Container(
              color: Colors.white30,
              width: double.infinity,
              height: 300.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/logIn');
                    },
                    child: Text('LOG IN',style: TextStyle(fontSize: 20.0, color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(250, 50),
                    primary: Colors.cyan[800],
                    onSurface: Colors.teal[700],
                  ),
                  ),
                  Text(" "),
                  Text("If you don't have account yet",style: TextStyle(fontSize: 20.0),),
                  Text(" "),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/SignUp');
                    },
                    child: Text('SIGN UP',style: TextStyle(fontSize: 20.0, color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(250, 50),
                      primary: Colors.cyan[900],
                      onSurface: Colors.teal[700],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
