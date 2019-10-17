import 'dart:core';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:scheduler/util/Classes.dart';
import '../util/timelineBuilder.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  PageController _pageController = new PageController(initialPage: DateTime.now().weekday < 5 ? DateTime.now().weekday - 1 : 0, keepPage: true);
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: new AppBar(
          title: Text("myScheduler", style: new TextStyle(
              color: Colors.black, fontSize: 35
          ),),
          backgroundColor: Colors.white,
        ),
        body: PageView(
          controller: _pageController,
          children: <Widget>[
            TimeLine(MondayClasses.eventList),
            TimeLine(TuesdayClasses.eventList),
            TimeLine(WednesdayClasses.eventList),
            TimeLine(ThursdayClasses.eventList),
            TimeLine(FridayClasses.eventList),
          ],
        ),
    );
  }
}
