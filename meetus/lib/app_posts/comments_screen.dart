import 'package:flutter/material.dart';
import 'package:schoolbookapp/app_posts/models/comment.dart';
import 'package:schoolbookapp/app_posts/models/post.dart';
import 'package:schoolbookapp/app_posts/widgets/comments/comment_textfield.dart';
import 'package:schoolbookapp/app_theme.dart';
import 'package:timeago/timeago.dart' as timeago;

class CommentsScreen extends StatefulWidget {
  static final routeName = "/post-comments-screen";
  final Post post;

  CommentsScreen(this.post);

  @override
  _CommentsScreenState createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  List<Comment> comments;

  @override
  void initState() {
    super.initState();
    comments = widget.post.comments;
  }

  _showBottomModalSheet(context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          height: (MediaQuery.of(context).size.height - 25.0),
          //padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Scaffold(
            appBar: AppBar(
              title: Text("Comments"),
            ),
            resizeToAvoidBottomInset: true,
            body: Container(
              color: Colors.white,
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: Container(
                        child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(
                              top: 5.0, bottom: 5.0, right: 5.0),
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20.0),
                                  bottomRight: Radius.circular(20.0))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "${comments[index].name}",
                                        style: TextStyle(
                                          color: Colors.blueGrey,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        child:
                                            Text("${comments[index].message}",
                                                overflow: TextOverflow.visible,
                                                style: TextStyle(
                                                  color: Colors.blueGrey,
                                                  fontSize: 14.0,
                                                  // fontWeight: FontWeight.w600),
                                                )),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Text(
                                    "${timeago.format(comments[index].date, locale: 'en_short')}",
                                    style: TextStyle(color: Colors.blueGrey),
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: comments.length,
                    )),
                    flex: 5,
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  Container(
                    child: PostTextField(widget.post),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.comment,
            color: Colors.grey,
          ),
          iconSize: 20,
          onPressed: () {
            _showBottomModalSheet(context);
          },
        ),
        Text(
          '${comments.length}',
          style: AppTheme.textTheme.caption,
        ),
      ],
    );
  }

  Widget appBar() {
    return SizedBox(
      height: AppBar().preferredSize.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 8),
            child: Container(
              width: AppBar().preferredSize.height - 8,
              height: AppBar().preferredSize.height - 8,
            ),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  'Comments',
                  style: TextStyle(
                    fontSize: 22,
                    color: AppTheme.darkText,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, right: 8),
            child: Container(
              width: AppBar().preferredSize.height - 8,
              height: AppBar().preferredSize.height - 8,
              color: Colors.white,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius:
                      BorderRadius.circular(AppBar().preferredSize.height),
                  child: Icon(
                    Icons.dashboard,
                    color: AppTheme.dark_grey,
                  ),
                  onTap: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
