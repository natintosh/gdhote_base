import 'package:flutter/material.dart';

class CloudShapePaint extends CustomPainter {
  final Color outerColor;
  final Color innerColor;

  CloudShapePaint(
      {this.outerColor = Colors.white, this.innerColor = Colors.white});

  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;

    Path cloudCurveOuterPath = Path();

    cloudCurveOuterPath.moveTo(0, height * 0.75);

    cloudCurveOuterPath.cubicTo(
      width * 0.25,
      height * 0.5,
      width * 0.75,
      height * 0.9,
      width,
      height * 0.8,
    );

    cloudCurveOuterPath.lineTo(width, height);
    cloudCurveOuterPath.lineTo(0, height);

    cloudCurveOuterPath.close();

    Path cloudCurveInnerPath = Path();

    cloudCurveInnerPath.moveTo(0, height * 0.8);

    cloudCurveInnerPath.cubicTo(
      width * 0.2,
      height * 0.8,
      width * 0.65,
      height * 0.5,
      width,
      height * 0.7,
    );

    cloudCurveInnerPath.lineTo(width, height);
    cloudCurveInnerPath.lineTo(0, height);

    cloudCurveInnerPath.close();

    canvas.drawPath(
        cloudCurveInnerPath,
        Paint()
          ..color = innerColor.withOpacity(0.3)
          ..style = PaintingStyle.fill);

    canvas.drawPath(
        cloudCurveOuterPath,
        Paint()
          ..color = outerColor.withOpacity(0.3)
          ..style = PaintingStyle.fill);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
