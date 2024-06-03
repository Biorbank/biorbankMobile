import 'dart:math';

import 'package:flutter/material.dart';

class CirclePainter extends CustomPainter {
  final double value;
  final double maxValue;
  final Color color;
  final List<Color> gradientColors;

  CirclePainter({
    required this.value,
    required this.maxValue,
    required this.color,
    required this.gradientColors,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double strokeWidth = 5;
    Rect rect = Offset.zero & size;
    double startAngle = -3.14 * 5 / 4;
    double sweepAngle = 2 * 3.14 * (value / maxValue) * 3 / 4;

    Paint backgroundPaint = Paint()
      ..shader = LinearGradient(
        colors: gradientColors,
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ).createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    Paint foregroundPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(rect, startAngle, 3.14 * 3 / 2, false, backgroundPaint);
    canvas.drawArc(rect, startAngle, sweepAngle, false, foregroundPaint);

    // Draw thumb
    double thumbRadius = 3;
    double thumbCenterRadius = (size.width - strokeWidth) / 2;
    double thumbX =
        size.width / 2 + thumbCenterRadius * cos(startAngle + sweepAngle);
    double thumbY =
        size.height / 2 + thumbCenterRadius * sin(startAngle + sweepAngle);

    Paint thumbBorderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Paint thumbPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    // Draw white border
    canvas.drawCircle(
        Offset(thumbX, thumbY), thumbRadius + 3, thumbBorderPaint);
    // Draw colored thumb
    canvas.drawCircle(Offset(thumbX, thumbY), thumbRadius, thumbPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
