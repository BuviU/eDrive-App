import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/WrittenExam.dart';
import 'package:flutter_app/screens/home.dart';
import 'package:flutter_app/widgets/active_project_card.dart';
import 'package:flutter_app/widgets/light_colors.dart';
import 'package:flutter_app/widgets/task_column.dart';
import 'package:flutter_app/widgets/top_container.dart';
import 'Training.dart';
import 'package:dio/dio.dart';

class WrittenExamResults extends StatelessWidget {
  Text subheading(String title) {
    return Text(
      title,
      style: TextStyle(
          color: LightColors.kDarkBlue,
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2),
    );
  }

  static CircleAvatar calendarIcon() {
    return CircleAvatar(
      radius: 25.0,
      backgroundColor: LightColors.kGreen,
      child: Icon(
        Icons.home,
        size: 20.0,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TopContainer(
              height: 200,
              width: width,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(Icons.assignment_outlined,
                            color: LightColors.kDarkBlue, size: 30.0),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 0.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[

                          CircleAvatar(
                            backgroundColor: LightColors.kBlue,
                            radius: 35.0,
                            backgroundImage: AssetImage(
                              'assests/ww.png',
                            ),
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  'Written Exam Results',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    color: LightColors.kDarkBlue,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  'Taniya Wijesekara',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black45,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ]),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              subheading('Results'),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Home()),
                                  );
                                },
                                child: calendarIcon(),
                              ),
                            ],
                          ),
                          SizedBox(height: 15.0),
                          TaskColumn(
                            icon: Icons.account_balance_wallet_sharp,
                            iconBackgroundColor: LightColors.kRed,
                            title: 'Woha! You passed the exam',
                            subtitle: 'Now, you can start your training',
                          ),
                          SizedBox(
                            height: 15.0,
                          ),

                          SizedBox(height: 15.0),
                        ],
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
                              Navigator.of(context).pushNamed('/Training');
                            },
                            child: Text('Start Training',style: TextStyle(fontSize: 20.0, color: Colors.white)),
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(250, 50),
                              primary: Colors.cyan[800],
                              onSurface: Colors.teal[700],
                            ),
                          ),
                          Text(" "),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/WrittenExam');
                            },
                            child: Text('Reface the exam',style: TextStyle(fontSize: 20.0, color: Colors.white)),
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
            ),
          ],
        ),
      ),
    );
  }
}
