import 'package:flutter/material.dart';
import 'package:schoolbookapp/app_theme.dart';

class HeaderClassStats extends StatelessWidget {
  const HeaderClassStats({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '49',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: AppTheme.fontName,
                fontWeight: FontWeight.w500,
                fontSize: 13,
                letterSpacing: -0.2,
                color: AppTheme.darkText,
              ),
            ),
            Text(
              'Total Pupils',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: AppTheme.fontName,
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: AppTheme.grey.withOpacity(0.5),
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              '24',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: AppTheme.fontName,
                fontWeight: FontWeight.w500,
                fontSize: 13,
                letterSpacing: -0.2,
                color: AppTheme.darkText,
              ),
            ),
            Text(
              'Male',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: AppTheme.fontName,
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: AppTheme.grey.withOpacity(0.5),
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              '25',
              style: TextStyle(
                fontFamily: AppTheme.fontName,
                fontWeight: FontWeight.w500,
                fontSize: 13,
                letterSpacing: -0.2,
                color: AppTheme.darkText,
              ),
            ),
            Text(
              'Female',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: AppTheme.fontName,
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: AppTheme.grey.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ],
    );
  }
}