import 'package:flutter/material.dart';
import 'package:schoolbookapp/app_child_profile/widgets/profile_header/header_class_stats.dart';
import 'package:schoolbookapp/app_theme.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 120.0,
      child: Row(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: deviceWidth * 0.3,
                child: Image.asset(
                  'assets/images/userImage.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: deviceWidth * 0.3,
                  color: Colors.black54,
                  padding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 20,
                  ),
                  child: FittedBox(
                    child: Text(
                      "RNFJ-8373788-JV",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Rutendo Blessing Mariza',
                    style: AppTheme.textTheme.title,
                  ),
                  Text(
                    'Grade 7 Yellow',
                    style: AppTheme.body2,
                  ),
                  Text(
                    'Mr Evelyn Mandihlare',
                    style: AppTheme.textTheme.caption,
                  ),
                  //_classStats(),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 7.0),
                    height: 1,
                    decoration: BoxDecoration(
                      color: AppTheme.nearlyBlack.withOpacity(0.4),
                      borderRadius: BorderRadius.all(
                        Radius.circular(4.0),
                      ),
                    ),
                  ),
                  HeaderClassStats(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
