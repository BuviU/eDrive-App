import 'package:flutter/material.dart';
import 'WrittenExam.dart';
import 'package:dio/dio.dart';

class MCReg extends StatefulWidget {
  MCReg({this.title});
  final String title;
  @override
  _MCRegState createState() => _MCRegState();
}

class _MCRegState extends State<MCReg> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _name;
  String _bloodType;
  String _weight;
  String _height;
  String _eyeSight;
  String _gender;

  Widget _buildNameField() {
    return TextFormField(
      validator: (text) {
        return HelperValidator.nameValidate(text);
      },
      maxLength: 20,
      maxLines: 1,
      decoration: InputDecoration(
          labelText: 'Full name',
          hintText: 'Enter name that you want to print on the licence'),
      onSaved: (value) {
        _name = value;
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
      InputDecoration(labelText: 'Blood Type', hintText: 'Enter your Blood Type'),
      onSaved: (value) {
        _bloodType = value;
      },
    );
  }

  Widget _buildMobileNumberField() {
    return TextFormField(
      maxLength: 10,
      keyboardType: TextInputType.number,
      validator: (text) {
        if (text.isEmpty) {
          return "Please enter valid mobile Number";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: 'Weight', hintText: 'Enter your weight'),
      onSaved: (value) {
        _weight = value;
      },
    );
  }

  Widget _buildAddressField() {
    return TextFormField(
      obscureText: true,
      maxLength: 10,
      validator: (text) {
        if (text.isEmpty) {
          return "Please enter your address";
        }
        return null;
      },
      decoration:
      InputDecoration(labelText: 'Height', hintText: 'Enter your Height'),
      onSaved: (value) {
        _height = value;
      },
    );
  }

  Widget _buildDateOfBirthField() {
    return TextFormField(
      maxLength: 10,
      validator: (text) {
        if (text.isEmpty) {
          return "Please enter your birthday";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: 'Eye Sight', hintText: 'Enter your Eye Sight'),
      onSaved: (value) {
        _eyeSight = value;
      },
    );
  }

  Widget _buildGenderField() {
    return TextFormField(
      obscureText: true,
      maxLength: 10,
      validator: (text) {
        if (text.isEmpty) {
          return "Please enter your gender";
        }
        return null;
      },
      decoration: InputDecoration(labelText: 'Gender', hintText: 'Male/female'),
      onSaved: (value) {
        _gender = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Medical Center Registration"),
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
                      child: _buildMobileNumberField(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _buildAddressField(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _buildDateOfBirthField(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _buildGenderField(),
                    ),
                    SizedBox(height: 50),
                    Container(
                      width: 150,
                      child: RaisedButton(
                        child: Text(
                          'Submit',
                          style: TextStyle(
                            color: Colors.purple,
                            fontSize: 16.0,
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            print('valid form');
                            _formKey.currentState.save();
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Container(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text('You are successfully submited'),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.end,
                                            children: [
                                              MaterialButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('ok'),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          } else {
                            print('not valid form');

                            return;
                          }
                        },
                      ),
                    ),
                  ],
                )),
          ),
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
