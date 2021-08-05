import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'userProfile.dart';
import 'package:dio/dio.dart';

class LogIn extends StatefulWidget {
  LogIn({this.title});
  final String title;
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _key = GlobalKey<FormState>();
  String email;
  String password;

  userLogin() {
    var isValid = _key.currentState.validate();
    FocusScope.of(context).unfocus();

    if (!isValid) {
      return;
    }
    _key.currentState.save();
    Navigator.of(context).pushNamed('/UserProfile');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Login",
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          backgroundColor: Colors.cyan[700],
          toolbarHeight: 50.0,
        ),
        body: ListView(
          children: <Widget>[
            Container(
              color: Colors.cyan[50],
              width: double.infinity,
              height: 200.0,
              child:
              Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Image.asset("assests/login.jpg",),
                  ]),
            ),
            Container(
              color: Colors.white,
              width: double.infinity,
              height: 300.0,
              child: Form(
                key: _key,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextFormField(
                        validator: (val) {
                          if (val == '') {
                            return 'your email is required';
                          }
                          return null;
                        },
                        onSaved: (val) {
                          email = val;
                        },
                        maxLength: 20,
                        autofocus: true,
                        cursorColor: Colors.cyan[700],
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.cyan[700]),
                        decoration: InputDecoration(
                          hintText: AutofillHints.email,
                          hintStyle: TextStyle(color: Colors.black45),
                        ),
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextFormField(
                        validator: (val) {
                          if (val == '') {
                            return 'password  is required';
                          }
                          return null;
                        },
                        onSaved: (val) {
                          password = val;
                        },
                        maxLength: 16,
                        obscureText: true,
                        autofocus: true,
                        cursorColor: Colors.cyan[700],
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.cyan[700]),
                        decoration: InputDecoration(
                          hintText: AutofillHints.password,
                          hintStyle: TextStyle(color: Colors.black45),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
              width: double.infinity,
              height: 50.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/home');
                    },
                    child: Text('Cancel',
                        style: TextStyle(fontSize: 20.0, color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(150, 50),
                      primary: Colors.cyan[800],
                      onSurface: Colors.teal[700],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: userLogin,
                    child: Text('OK',
                        style: TextStyle(fontSize: 20.0, color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(150, 50),
                      primary: Colors.cyan[900],
                      onSurface: Colors.teal[700],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
