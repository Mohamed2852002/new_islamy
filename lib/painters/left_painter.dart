
import 'package:flutter/material.dart';

class LeftPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final myPaint = Paint();
    myPaint.color = const Color(0xffE2BE7F);

    Path path = Path();
    path.moveTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width - 10, size.height, size.width, 0);

    path.close();

    canvas.drawPath(path, myPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
