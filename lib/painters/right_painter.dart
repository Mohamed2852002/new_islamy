import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RightPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final myPaint = Paint();
    myPaint.color = const Color(0xffE2BE7F);

    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.quadraticBezierTo(10.w, size.height, 0, 0);

    path.close();

    canvas.drawPath(path, myPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
