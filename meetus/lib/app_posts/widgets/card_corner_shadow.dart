import 'package:flutter/material.dart';
import 'package:schoolbookapp/app_chat_groups/utils/triangle_painter.dart';

class CardCornerShadow extends StatelessWidget {
  const CardCornerShadow({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 5.0,
          width: 3.0,
          child: CustomPaint(
            painter: TrianglePainter(),
          ),
        ),
      ],
    );
  }
}