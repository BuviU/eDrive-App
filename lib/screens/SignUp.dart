import 'package:flutter/material.dart';
import 'home.dart';
import 'userProfile.dart';
import 'package:dio/dio.dart';

class SignUp extends StatefulWidget {
  SignUp({this.title});
  final String title;
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _username;
  String _email;
  String _password;

  final _key = GlobalKey<FormState>();

  userLogin() {
    var isValid = _key.currentState.validate();
    FocusScope.of(context).unfocus();

    if (!isValid) {
      return;
    }
    _key.currentState.save();
    Navigator.of(context).pushNamed('/UserProfile');
  }

  Widget _buildNameField() {
    return TextFormField(
      validator: (text) {
        return HelperValidator.nameValidate(text);
      },
      maxLength: 8,
      maxLines: 1,
      decoration:
          InputDecoration(labelText: 'Username', hintText: 'Enter a username'),
      onSaved: (value) {
        _username = value;
      },
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      maxLength: 20,
      validator: (text) {
        if (text.isEmpty) {
          return "Please enter a valid email";
        }
        return null;
      },
      decoration:
          InputDecoration(labelText: 'Email', hintText: 'Enter your email'),
      onSaved: (value) {
        _email = value;
      },
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      obscureText: true,
      maxLength: 20,
      validator: (text) {
        if (text.isEmpty) {
          return "Please enter a password";
        }
        return null;
      },
      decoration:
          InputDecoration(labelText: 'Password', hintText: 'Enter a password'),
      onSaved: (value) {
        _password = value;
      },
    );
  }

  Widget _buildConfirmPasswordField() {
    return TextFormField(
      obscureText: true,
      maxLength: 20,
      validator: (text) {
        if (text.isEmpty) {
          return "Please enter your password again";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: 'Confirm Password', hintText: 'Enter your password again'),
      onSaved: (value) {
        _password = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "SignUp",
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          backgroundColor: Colors.cyan[700],
          toolbarHeight: 50.0,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(24.0),
            child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Colors.cyan[50],
                      width: double.infinity,
                      height: 200.0,
                      child:
                      Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Image.asset("assests/car.jpg",),
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _buildNameField(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _buildEmailField(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _buildPasswordField(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _buildConfirmPasswordField(),
                    ),
                    SizedBox(height: 50),
                    Container(
                      width: 150,
                      child: RaisedButton(
                        color: Colors.cyan[900],
                        child: Text(
                          'CREATE',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            Navigator.of(context).pushNamed('/logIn');
                            _formKey.currentState.save();
                          } else {
                            print('not valid form');

                            return;
                          }
                        },
                      ),
                    ),
                    Text(
                      "Already have an account?",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/logIn');
                      },
                      child:
                      Text('Switch to login',
                          style:
                              TextStyle(fontSize: 20.0, color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(250, 50),
                        primary: Colors.cyan[600],
                        onSurface: Colors.teal[700],
                      ),
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}

class HelperValidator {
  static String nameValidate(String value) {
    if (value.isEmpty) {
      return "Name can't be empty";
    }
    if (value.length < 2) {
      return "Name must be at least 2 characters long";
    }
    if (value.length > 50) {
      return "Name must be less than 50 characters long";
    }
    return null;
  }
}
