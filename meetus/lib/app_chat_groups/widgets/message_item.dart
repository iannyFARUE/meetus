import 'package:flutter/material.dart';

class MessageItem extends StatelessWidget {
  final bool isMe;
  final String message;

  MessageItem({this.isMe, this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: isMe ? EdgeInsets.only(left: 40) : EdgeInsets.only(right: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
              mainAxisAlignment:
                  isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
              crossAxisAlignment:
                  isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                      gradient: isMe
                          ? LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              stops: [
                                  0.1,
                                  1
                                ],
                              colors: [
                                  Color(0xFFF6D365),
                                  Color(0xFFFDA085),
                                ])
                          : LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              stops: [
                                  0.1,
                                  1
                                ],
                              colors: [
                                  Color(0xFFEBF5FC),
                                  Color(0xFFEBF5FC),
                                ]),
                      borderRadius: isMe
                          ? BorderRadius.only(
                              topRight: Radius.circular(15),
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(0))
                          : BorderRadius.only(
                              topRight: Radius.circular(15),
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(15))),
                  child: Column(
                    crossAxisAlignment: isMe
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        message,
                        textAlign: isMe ? TextAlign.end : TextAlign.start,
                        overflow: TextOverflow.visible,
                        style:
                            TextStyle(color: isMe ? Colors.white : Colors.grey),
                      ),
                    ],
                  ),
                )
              ])
        ],
      ),
    );
  }
}
