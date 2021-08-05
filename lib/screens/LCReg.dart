import 'package:flutter/material.dart';
import 'MedicalCenter.dart';

class LCReg extends StatefulWidget {
  LCReg({this.title});
  final String title;
  @override
  _LCRegState createState() => _LCRegState();
}

class _LCRegState extends State<LCReg> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _category;
  String _address;
  String _birthday;
  String _gender;

  Widget _buildNameField() {
    return TextFormField(
      validator: (text) {
        return HelperValidator.nameValidate(text);
      },
      maxLength: 20,
      maxLines: 1,
      decoration: InputDecoration(
          labelText: 'Vehicle Category',
          hintText: 'Enter Vehicle Category that you want to apply'),
      onSaved: (value) {
        _category = value;
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
        _birthday = value;
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
          title: Text("Learners Center Registration"),
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
            Navigator.of(context).pushNamed('/MedicalCenter');
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
