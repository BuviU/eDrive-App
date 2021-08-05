import 'package:flutter/material.dart';
import 'LCReg.dart';

class LearnersCenter extends StatefulWidget {
  LearnersCenter({this.title});
  final String title;
  @override
  _LearnersCenterState createState() => _LearnersCenterState();
}

class _LearnersCenterState extends State<LearnersCenter> {
  String dropDownvalue = 'Ampara';
  String center = 'Amaya learners';
  String category = "All Cars/Dual Purpose-B";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Learners' Center"),
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
                      image: AssetImage("assests/one.jpg"),
                      fit: BoxFit.cover)),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset("assests/ee.png", alignment: Alignment.center),
                    Text(""),
                    Text(
                      "Get your License Online",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ]),
            ),
            Container(
              color: Colors.white60,
              width: double.infinity,
              height: 300.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Select District",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  new DropdownButton<String>(
                    value: dropDownvalue,
                    items: <String>[
                      'Ampara',
                      'Anuradhapura',
                      'Badulla',
                      'Colombo',
                      'Kgalle',
                      'Gampaha'
                    ].map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                    onChanged: (newVal) {
                      setState(() {
                        dropDownvalue = newVal;
                      });
                    },
                  ),
                  Text(
                    "Select Learner's center",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  new DropdownButton<String>(
                    value: center,
                    items: <String>[
                      'Amaya learners',
                      'Banu learners',
                      'Raja learners',
                      'Zip learners'
                    ].map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        center = value;
                      });
                    },
                  ),
                  Text(
                    "Select Vehicle Category",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),

                  new DropdownButton<String>(
                    value: category,
                    items: <String>[
                      'All Cars/Dual Purpose-B',
                      'Motor Cycles-A',
                      'Light Motor Cycle-A1',
                      'Land Vehicles-G',
                      'Hand Tractors-G1',
                    ].map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        category = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              width: double.infinity,
              height: 100.0,
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.cyan[700],
          child: Icon(Icons.arrow_forward_ios),
          onPressed: () {
            Navigator.of(context).pushNamed('/MedicalCenter');
          },
        ),
      ),
    );
  }
}
