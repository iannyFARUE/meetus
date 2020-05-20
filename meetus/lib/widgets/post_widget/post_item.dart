import 'package:flutter/material.dart';
import 'package:schoolbookapp/models/post.dart';
import 'package:schoolbookapp/paths/triangle_path.dart';
import 'package:schoolbookapp/widgets/post_widget/post_docs.dart';
import 'package:schoolbookapp/widgets/post_widget/post_header.dart';
import 'package:schoolbookapp/widgets/post_widget/post_images.dart';
import 'package:schoolbookapp/widgets/post_widget/post_title_description.dart';

class PostItem extends StatelessWidget {
  final Post post;

  PostItem(this.post);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TrianglePath(),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
          ),
        ),
        elevation: 4,
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Column(
          children: <Widget>[
            PostHeader(),
            PostTitleDescription(post),
            if(post.images.length >= 0) Container(
              height: 300, //constraints.maxHeight * 0.4,
              width: double.infinity,
              margin: EdgeInsets.all(5),
              child: PostImages(post.images), 
            ),
            if (post.documents.length > 0) PostDocs(post.documents[0]),
            //PostDocs(post.documents[0]),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 1,
                    color: Colors.grey,
                  ),
                ),
              ),
              //margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.favorite_border),
                        onPressed: null,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text('23'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.comment),
                        onPressed: null,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text('113'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
