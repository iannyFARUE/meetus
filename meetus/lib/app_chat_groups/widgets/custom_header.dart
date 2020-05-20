import 'package:flutter/material.dart';
import 'package:schoolbookapp/app_theme.dart';

class CustomHeader extends StatelessWidget {
  final String title;

  CustomHeader(this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: Stack(
        children: <Widget>[
          Container(
              padding: EdgeInsets.fromLTRB(15, 0, 0, 15),
              child: Row(
                children: <Widget>[
                  Text(title,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black))
                ],
              )),
          Positioned(
            width: 40,
            height: 4,
            bottom: 0,
            left: 15,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      stops: [
                        0.1,
                        1
                      ],
                      colors: [
                        AppTheme.nearlyBlue,
                        AppTheme.nearlyDarkBlue,
                      ])),
            ),
          )
        ],
      ),
    );
  }
}
