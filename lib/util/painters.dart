import 'dart:ui';

import 'package:flutter/material.dart';

class TimelinePainter extends CustomPainter {
  var paragraphStyle = ParagraphStyle();

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;
    for (int i = 0; i <= 96; i++) {
      if (i % 4 == 0) {
        TextSpan span;
        if (i == 0)
          span = TextSpan(style: TextStyle(color: Colors.white, fontSize: 15),
              text: '12:00 am');
        else if (i / 4 == 12)
          span = TextSpan(style: TextStyle(color: Colors.white, fontSize: 15),
              text: '12:00 pm');
        else if (i / 4 > 12)
          span = TextSpan(style: TextStyle(color: Colors.white, fontSize: 15),
              text: '${(i ~/ 4) - 12}:00 pm');
        else
          span = TextSpan(style: TextStyle(color: Colors.white, fontSize: 15),
              text: '${(i ~/ 4)}:00 am');
        TextPainter tp = TextPainter(text: span,
            textAlign: TextAlign.left,
            textDirection: TextDirection.ltr);
        tp.layout();
        tp.paint(canvas, Offset(0.0, 45 * i.toDouble()));
        canvas.drawLine(Offset(0.0, 45 * i.toDouble()),
            Offset(50.0, 45 * i.toDouble()), paint);
      }
      else
        canvas.drawLine(Offset(0.0, 45 * i.toDouble()),
            Offset(30.0, 45 * i.toDouble()), paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}

class CurrTimePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;
    canvas.drawLine(Offset(0.0, size.height/2),
        Offset(size.width, size.height/2), paint);
  }
  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
