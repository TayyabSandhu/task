import 'package:flutter/material.dart';
import 'package:task/resources/color.dart';

class StoriesCircle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    const Gradient gradient = LinearGradient(
      colors: [AppColors.primaryGradientOne, AppColors.primaryGradientSecond],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    final Paint paint = Paint()
      ..shader = gradient.createShader(rect)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    canvas.drawOval(rect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}