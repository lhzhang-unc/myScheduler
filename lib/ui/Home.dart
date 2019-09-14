import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../util/classEvent.dart';
import '../util/timelineBuilder.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static var class1 = new ClassEvent("Break", 545, false, "12:00 am");
  static var class2 = new ClassEvent("PHYS 118-002", 50, true, "9:05 am");
  static var class3 = new ClassEvent("Break", 145, false, "9:55 am");
  static var class4 = new ClassEvent("PHYS 118-502", 110, true, "12:20 pm");
  static var class5 = new ClassEvent("Break", 20, false, "2:10 pm");
  static var class6 = new ClassEvent("ENGL 105-024", 50, true, "2:30 pm");
  static var class7 = new ClassEvent("Break", 530, false, "3:10 pm");
  List<ClassEvent> classListM = [class1, class2, class3, class4, class5, class6, class7];
  List<ClassEvent> classListT;
  List<ClassEvent> classListW = [class1, class2, class3, class4, class5, class6, class7];
  PageController _pageController = new PageController();

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
            TimeLine(classListM),
            TimeLine(classListM),
            TimeLine(classListW),
            TimeLine(classListW),
            TimeLine(classListM),
          ],
        ),
    );
  }
}
