import 'package:flutter/material.dart';
import 'MCReg.dart';
import 'package:dio/dio.dart';

class MedicalCenter extends StatefulWidget {
  MedicalCenter({this.title});
  final String title;
  @override
  _MedicalCenterState createState() => _MedicalCenterState();
}

class _MedicalCenterState extends State<MedicalCenter> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Medical'Center"),
          backgroundColor: Colors.white,
          toolbarHeight: 50.0,
        ),
        body: ListView(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 300.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assests/medical.jpg"),
                      fit: BoxFit.cover)),
            ),
            Container(
              color: Colors.white60,
              width: double.infinity,
              height: 400.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "210 Molagoda Kirulupana Road,",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),

                  Text(
                    " Karadupana,",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),

                  Text(
                      " Sri Lanka ",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),

                  Text(
                    "+94 352 051 957",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Image.asset("assests/location.PNG",width: 200,height: 200,),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              width: double.infinity,
              height: 100.0,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.cyan[700],
          child: Icon(Icons.arrow_forward_ios),
          onPressed: () {
            Navigator.of(context).pushNamed('/WrittenExam');
          },
        ),
      ),
    );
  }
}
