import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './classEvent.dart';
import './widgetBuilders.dart';
import './painters.dart';

class TimeLine extends StatelessWidget {
  final ScrollController _syncController1 =
      new ScrollController(); // make seperate controllers
  final ScrollController _syncController2 =
      new ScrollController(); // for each scrollables
  final List<ClassEvent> classList;

  TimeLine(this.classList,);

  @override
  Widget build(BuildContext context) {
    _handleNew();
    return new Stack(
      children: <Widget>[
        Image.asset(
          'assets/u4kk6a3anwnz.jpg',
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
        ),
        NotificationListener<ScrollNotification>(
            // this part right here is the key
            child: Stack(children: <Widget>[
              SingleChildScrollView(
                // this one stays at the back
                controller: _syncController1,
                child: CustomPaint(
                  size: Size(1000, 4320),
                  painter: TimelinePainter(),
                ),
              ),

              RefreshIndicator(
                onRefresh: _handleRefresh,
                child: CustomScrollView(
                  controller: _syncController2,
                  slivers: <Widget>[
                    RefreshIndicator(
                      onRefresh: _handleRefresh,
                      child: SliverList(
                        delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                            if (classList.length > index)
                              return BodyWidget(
                                  classList[index].className,
                                  classList[index].eventLength,
                                  classList[index].isClass,
                                  classList[index].classHour);
                            else return null;
                          },
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              Center(
                child: CustomPaint(
                  size: Size(1000, 3),
                  painter: CurrTimePainter(),),
              )
            ]),
            onNotification: (ScrollNotification scrollInfo) {
              // this will set controller1's offset the same as controller2's
              _syncController1.jumpTo(_syncController2.offset);
              return null;
              // you can check both offsets in terminal
            })
      ],
    );
  }
  Future<Null> _handleRefresh() async {
    //refreshes back to the current time
    await new Future.delayed(new Duration(milliseconds: 500));
    double currOffset = (DateTime.now().hour *60 + DateTime.now().minute) * 3.0 - 360;
    _syncController2.animateTo(currOffset, duration: Duration(milliseconds: 750), curve: Curves.easeIn);
    return null;
    //TO DO: find way to set the bar to the middle dynamically
  }

  Future<Null> _handleNew() async {
    await new Future.delayed(new Duration(milliseconds: 0));
    double currOffset = (DateTime.now().hour *60 + DateTime.now().minute) * 3.0 - 360;
    _syncController2.jumpTo(currOffset);
    return null;
  }
}
