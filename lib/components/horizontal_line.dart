import 'package:flutter/material.dart';

class DrawHorizontalLine extends CustomPainter {
  ///
  /// percentage is a value between 0 and 1, which represent a percentage where 1 is 100%
  DrawHorizontalLine(
      {this.percentage: 0.0, this.color: Colors.red, this.width: 3}) {
    AssertionError();

    _paint
      ..color = color
      ..strokeWidth = width
      ..strokeCap = StrokeCap.round;
  }

  final Paint _paint = Paint();
  final double percentage;
  final double width;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(
        Offset(0.0, 1.5), Offset(size.width * percentage, 1.5), _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
