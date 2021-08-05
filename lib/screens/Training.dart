import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/calender_dates.dart';
import 'package:flutter_app/widgets/dates_list.dart';
import 'package:flutter_app/widgets/light_colors.dart';
import 'package:flutter_app/widgets/task_container.dart';
import 'package:flutter/widgets.dart';
import 'package:dio/dio.dart';

class Training extends StatelessWidget {
  Widget _dashedText() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Text(
        '------------------------------------------',
        maxLines: 1,
        style:
        TextStyle(fontSize: 20.0, color: Colors.black12, letterSpacing: 5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[50],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            20,
            20,
            20,
            0,
          ),
          child: Column(
            children: <Widget>[
              SizedBox(height: 30.0),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '25/10/2021',
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.w700),
                    ),
                    Container(
                      height: 40.0,
                      width: 120,
                      decoration: BoxDecoration(
                        color: LightColors.kDarkBlue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextButton(
                        child: Icon(Icons.arrow_forward_ios),
                        onPressed: (){
                          //   Navigator.of(context).push(MaterialPageRoute(
                          //  builder:(_){
                          //   return Home();
                          //   },
                          //  ));
                          Navigator.of(context).pushNamed('/PracticalExam');
                        },
                      ),
                    ),
                  ]),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Your Training',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Calender',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                height: 58.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: days.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CalendarDates(
                      day: days[index],
                      date: dates[index],
                      dayColor: index == 0 ? Colors.red : Colors.black54,
                      dateColor:
                      index == 0 ? Colors.red : Colors.blue,
                    );
                  },
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: ListView.builder(
                            itemCount: time.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) =>
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 15.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      '${time[index]} ${time[index] > 8 ? 'PM' : 'AM'}',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ),
                                ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          flex: 5,
                          child: ListView(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children: <Widget>[
                              _dashedText(),
                              TaskContainer(
                                title: 'Practice Bike',
                                subtitle:
                                'Round 1',
                                boxColor: Colors.cyan[300],
                              ),
                              _dashedText(),
                              TaskContainer(
                                title: 'Practice Car',
                                subtitle: 'Round 1',
                                boxColor: Colors.cyan[700],
                              ),
                              TaskContainer(
                                title: 'Practice ThreeWeel',
                                subtitle: 'Round 1',
                                boxColor: Colors.cyan[900],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
