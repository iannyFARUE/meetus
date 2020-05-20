import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:schoolbookapp/app_posts/models/school.dart';
import 'package:schoolbookapp/app_theme.dart';

class PostHeader extends StatelessWidget {
  final School school;

  PostHeader(this.school);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomRight: Radius.circular(15),
            ),
            color: AppTheme.nearlyDarkBlue.withOpacity(0.7),
          ),
          //height: 60,
          //width: 75,  //later make the width dynamic
          height: MediaQuery.of(context).size.width * 0.16,
          width: MediaQuery.of(context).size.width * 0.17,
          alignment: Alignment.center,
          child: Text(
            school.abbreviation,
            style: AppTheme.textTheme.subhead,
          ),
        ),
        Expanded(
          child: Container(
            //width: 270,
            //height: 60,
            height: MediaQuery.of(context).size.width * 0.16,
            padding: EdgeInsets.only(left: 8, top: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  school.name,
                  overflow: TextOverflow.ellipsis,
                  style: AppTheme.textTheme.title,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "13-04-2020 14:09",
                      style: AppTheme.textTheme.caption,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Icon(
                      Icons.lens,
                      size: 5,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Icon(
                      Icons.public,
                      size: 15,
                    ), //Icon(Icons.lock, size: 15,)
                  ],
                ),
                Text(
                  school.location,
                  style: AppTheme.textTheme.caption,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
