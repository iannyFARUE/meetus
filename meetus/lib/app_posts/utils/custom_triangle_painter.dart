import 'package:flutter/material.dart';
import 'package:schoolbookapp/app_theme.dart';

class CustomTrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
     Paint paint = Paint()
      ..color = AppTheme.nearlyDarkBlue.withOpacity(0.7)
      ..strokeWidth = 0.0;
    Path path = Path();
    //path.moveTo(0.0, size.height);
    path.lineTo(size.width - 20, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
