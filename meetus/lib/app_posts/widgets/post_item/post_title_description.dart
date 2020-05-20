import 'package:flutter/material.dart';
import 'package:schoolbookapp/app_posts/models/post.dart';
import 'package:schoolbookapp/app_theme.dart';

class PostTitleDescription extends StatelessWidget {
  final Post post;

  PostTitleDescription(this.post);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10, top: 10),
            width: double.infinity,
            child: Text(
              post.title,
              style: AppTheme.subtitle,
            ),
          ),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(left: 10, top: 10, right: 5),
              width: double.infinity,
              child: Text(
                post.description,
                style: AppTheme.body2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
