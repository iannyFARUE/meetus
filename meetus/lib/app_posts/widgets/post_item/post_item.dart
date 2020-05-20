import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schoolbookapp/app_posts/comments_screen.dart';
import 'package:schoolbookapp/app_posts/utils/triangle_path.dart';
import 'package:schoolbookapp/app_posts/widgets/card_corner_clip.dart';
import 'package:schoolbookapp/app_posts/widgets/card_corner_shadow.dart';
import 'package:schoolbookapp/app_posts/widgets/post_item/post_docs.dart';
import 'package:schoolbookapp/app_posts/widgets/post_item/post_header.dart';
import 'package:schoolbookapp/app_posts/widgets/post_item/post_images.dart';
import 'package:schoolbookapp/app_posts/widgets/post_item/post_title_description.dart';
import 'package:schoolbookapp/app_theme.dart';
import 'package:schoolbookapp/app_posts/models/post.dart';

class PostItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final post = Provider.of<Post>(context, listen: false);
    return Container(
      //height: MediaQuery.of(context).size.height * 0.6,
      margin: EdgeInsets.only(top: 10, left: 5, right: 5),
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: TrianglePath(),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                ),
              ),
              elevation: 2,
              child: Column(
                children: <Widget>[
                  Container(
                    child: PostHeader(post.school),
                  ),
                  PostTitleDescription(post),
                  if (post.images.length > 0)
                    Container(
                      height: MediaQuery.of(context).size.height * 0.30,
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 10),
                      child: PostImages(post.images),
                    ),
                  if (post.documents.length > 0) PostDocs(post.documents[0]),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          width: 1,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Consumer<Post>(
                          builder: (ctx, post, child) {
                            return Row(
                              children: <Widget>[
                                IconButton(
                                  iconSize: 20,
                                  icon: post.isLiked
                                      ? Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        )
                                      : Icon(
                                          Icons.favorite_border,
                                          //color: AppTheme.nearlyDarkBlue,
                                        ),
                                  onPressed: () {
                                    post.toggleFavourite();
                                    // posts.toggleLikes(post);
                                  },
                                  splashColor: Colors.purple,
                                ),
                                Text(
                                  '${post.likes.length}',
                                  style: AppTheme.textTheme.caption,
                                ),
                              ],
                            );
                          },
                        ),
                        Row(
                          children: <Widget>[
                            Theme(
                              data: Theme.of(context)
                                  .copyWith(canvasColor: Colors.transparent),
                              child: CommentsScreen(post),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            //left: 250,
            right: 5,
            child: CardCornerClip(),
          ),
          Positioned(
            right: 25,
            child: CardCornerShadow(),
          ),
        ],
      ),
    );
  }
}
