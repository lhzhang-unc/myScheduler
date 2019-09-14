import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BodyWidget extends StatelessWidget {
  final String _className;
  final double _eventLength;
  final bool _isClass;
  final String hour;

  BodyWidget(this._className, this._eventLength, this._isClass, this.hour);

  @override

  Widget build(BuildContext context) {
    if (_isClass) {
      return new Row(
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: this._eventLength * 3,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                  ),
                ],
              )),
          Expanded(
              flex: 4,
              child: Stack(
                children: <Widget>[
                  Opacity(
                    opacity: 0.50,
                    child: MaterialButton(
                      onPressed: () => null,
                      height: this._eventLength * 3,
                      minWidth: double.infinity,
                      color: Colors.white,
                    ),
                ),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "${this._className}",
                                style: new TextStyle(
                                    fontWeight: FontWeight.w300, fontSize: 40, color: Colors.black),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                this.hour,
                                style: new TextStyle(
                                    fontWeight: FontWeight.w200, fontSize: 35, color: Colors.black),
                                textAlign: TextAlign.left,
                              ),
                            ])),
                  )
                ],
              )),
        ],
      );
    } else
      return new Container(
        height: this._eventLength * 3,
        color: Colors.transparent,
        alignment: Alignment.center,
      );
  }
}
