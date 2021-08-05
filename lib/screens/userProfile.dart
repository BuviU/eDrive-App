import 'package:flutter/material.dart';
import 'LearnersCenter.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart';

class UserProfile extends StatefulWidget {
  UserProfile({this.title});
  final String title;
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _name;
  String _email;
  int _mobile;
  String _address;
  int _birthday;
  String _nic;
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
          InputDecoration(labelText: 'Email', hintText: 'Enter your email'),
      onSaved: (value) {
        _email = value;
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
          labelText: 'Mobile Number', hintText: 'Enter a mobile number'),
      onSaved: (value) {
        _mobile = int.parse(value);
      },
    );
  }

  Widget _buildAddressField() {
    return TextFormField(
      maxLength: 30,
      validator: (text) {
        if (text.isEmpty) {
          return "Please enter your address";
        }
        return null;
      },
      decoration:
          InputDecoration(labelText: 'Address', hintText: 'Enter your address'),
      onSaved: (value) {
        _address = value;
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
          labelText: 'Date of Birth', hintText: 'Enter your birthday'),
      onSaved: (value) {
        _birthday = int.parse(value);
      },
    );
  }

  Widget _buildGenderField() {
    return TextFormField(
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

  Widget _buildNICField() {
    return TextFormField(
      maxLength: 10,
      validator: (text) {
        if (text.isEmpty) {
          return "Please enter your NIC";
        }
        return null;
      },
      decoration: InputDecoration(labelText: 'NIC', hintText: 'NIC'),
      onSaved: (value) {
        _nic = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("User Profile"),
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _buildNICField(),
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
                            Navigator.of(context).pushNamed('/LearnersCenter');
                            _formKey.currentState.save();
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Container(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text('You are successfully submitted'),
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
