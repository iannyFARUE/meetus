import 'package:flutter/material.dart';
import 'package:schoolbookapp/models/post.dart';

class PostTitleDescription extends StatelessWidget {
  final Post post;

  PostTitleDescription(this.post);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 10, top: 10),
          width: double.infinity,
          child: Text(
            post.title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 10, top: 10, right: 5),
            width: double.infinity,
            child: Text(
              post.description,
              style: TextStyle(),
            ),
          ),
        ),
      ],
    );
  }
}
