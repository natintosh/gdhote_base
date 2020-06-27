import 'dart:math' as Math;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class StarShapePaint extends CustomPainter {
  final int sides;
  final double steps;
  final Color starColor;
  final Color crossColor;

  const StarShapePaint({
    this.sides = 5,
    this.starColor = Colors.blue,
    this.crossColor = Colors.white,
  }) : steps = 360 / sides;

  static const double kDegreeToRadian = Math.pi / 180;

  @override
  void paint(Canvas canvas, Size size) {
    double diameter = size.shortestSide;
    double radius = diameter / 2;

    Path starPath = Path();

    starPath.moveTo(radius, 0);

    for (int i = 1; i <= sides; i++) {
      double pointAInclinedAt = steps * kDegreeToRadian * i * 2;
      double x = radius + Math.sin(pointAInclinedAt) * radius;
      double y = radius - Math.cos(pointAInclinedAt) * radius;

      starPath.lineTo(x, y);
    }
    starPath.close();

    Path crossPath = Path();

    crossPath.moveTo(radius, radius * 0.70);
    crossPath.lineTo(radius, radius + radius * 0.25);

    crossPath.moveTo(radius - radius * 0.20, radius - radius * 0.15);
    crossPath.lineTo(radius + radius * 0.20, radius - radius * 0.15);

    canvas.drawPath(
      starPath,
      Paint()
        ..style = PaintingStyle.fill
        ..color = starColor,
    );

    canvas.drawPath(
        crossPath,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = radius * 0.1
          ..color = crossColor);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
