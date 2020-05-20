import 'package:flutter/material.dart';
import 'package:schoolbookapp/app_posts/utils/custom_triangle_painter.dart';

class CardCornerClip extends StatelessWidget {
  const CardCornerClip({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        SizedBox(
          height: 20.0, //this height should be a certain percentage of the height of the post header
          width: 20.0,
          child: CustomPaint(
            painter: CustomTrianglePainter(),
          ),
        ),
      ],
    );
  }
}
