import 'dart:math';
import 'package:flutter/material.dart';
class ShapePainter extends CustomPainter {
  final double radians;
  final double radius;
  final BuildContext context;
  ShapePainter(this.radians, this.radius,this.context);
  @override
  void paint(Canvas canvas, Size size) {
    final double xc=size.width/2;
    final double yc=size.height/2;
    Offset center=Offset(xc, yc);
    final double xc2=xc+radius*2*cos(radians);
    final double yc2=yc+radius*2*sin(radians);
    Offset centre2=Offset(xc2,yc2);
    Paint paint=Paint()
      ..color=const Color.fromRGBO(255, 255, 0, 0.5)
      ..strokeWidth=5
      ..style=PaintingStyle.fill
      ..strokeCap = StrokeCap.round
    ;
    Paint paint2=Paint()
      ..color=const Color.fromRGBO(255, 0, 0, 0.5)
      ..strokeWidth=5
      ..style=PaintingStyle.fill
      ..strokeCap = StrokeCap.round;
    Paint paint3=Paint()
      ..color=Theme.of(context).primaryColor
      ..strokeWidth=5
      ..style=PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    canvas.drawCircle(center, radius*2, paint3);
    canvas.drawCircle(centre2, radius+2, paint3);
    canvas.drawCircle(centre2, radius, paint);
    final double xp= radius*cos(radians*3)+xc2;
    final double yp=yc2+radius*sin(radians*3);
    canvas.drawCircle(centre2, 5, paint2);
    canvas.drawLine(centre2, Offset(xp,yp), paint2);
    canvas.drawCircle(Offset(xp,yp), 10, paint2);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}