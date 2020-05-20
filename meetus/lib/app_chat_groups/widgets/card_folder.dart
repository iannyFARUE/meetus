import 'package:flutter/material.dart';
import 'package:schoolbookapp/app_chat_groups/utils/triangle_painter.dart';
import 'package:schoolbookapp/app_theme.dart';

class CardFolder extends StatelessWidget {
  const CardFolder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 8.0,
          width: 6.0,
          child: CustomPaint(
            painter: TrianglePainter(),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: AppTheme.nearlyDarkBlue.withOpacity(0.7),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0))),
          width: 80.0,
          height: 30.0,
          child: Center(
            child: FittedBox(
              child: Text(
                'Chat(s) 232',
                style: AppTheme.textTheme.display2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
