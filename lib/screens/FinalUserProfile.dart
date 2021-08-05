import 'package:flutter/material.dart';
import 'start.dart';
import 'SignUp.dart';
import 'package:dio/dio.dart';

class FinalUserProfile extends StatefulWidget {
  FinalUserProfile({this.title});
  final String title;
  @override
  _FinalUserProfileState createState() => _FinalUserProfileState();
}

class _FinalUserProfileState extends State<FinalUserProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:Text("My Profile"),
          backgroundColor: Colors.cyan[700],
          toolbarHeight: 50.0,
        ),

        body: ListView(
          children:<Widget>[

            Container(
              color: Colors.white,
              width: double.infinity,
              height: 500.0,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset("assests/ww.png",alignment: Alignment.center),
                    Text("Name: Taniya Wijesekara",style:TextStyle(fontSize: 20.0,color:Colors.black),),
                    Text(""),
                    Text("Email: taniya@gmail.com",style:TextStyle(fontSize: 20.0,color:Colors.black),),
                    Text(""),
                    Text("Tel No:0712003007",style:TextStyle(fontSize: 20.0,color:Colors.black),),
                    Text(""),
                    Text("Address: G125, Paragammana, Kegalle",style:TextStyle(fontSize: 20.0,color:Colors.black),),
                    Text(""),
                    Text("Birthday : 05/6/1997",style:TextStyle(fontSize: 20.0,color:Colors.black),),
                    Text(""),
                    Text("Gender : Female",style:TextStyle(fontSize: 20.0,color:Colors.black),),
                  ]
              ),
            ),
            Container(
              color: Colors.white,
              width: double.infinity,
              height: 50.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/MyLicence');
                    },
                    child: Text('My Licences',style: TextStyle(fontSize: 20.0, color: Colors.white)),
                  ),
                ],
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.cyan[700],
          child: Icon(Icons.home),
          onPressed: () {
            Navigator.of(context).pushNamed('/home');
          },
        ),
      ),
    );
  }
}
