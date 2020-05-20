import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schoolbookapp/app_chat_groups/models/message.dart';
import 'package:schoolbookapp/app_theme.dart';
import 'package:schoolbookapp/app_chat_groups/providers/selected_chats_provider.dart';

class BuildMessageReply extends StatelessWidget {
  final Message message;
  const BuildMessageReply(this.message);

  @override
  Widget build(BuildContext context) {
    final selectedData = Provider.of<SelectedChats>(context, listen: false);
    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.only(top: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: AppTheme.nearlyBlack.withOpacity(0.08),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: Text(
                    'Rutendo Mariza',
                    style: AppTheme.caption,
                  ),
                ),
                InkWell(
                  onTap: () {
                    selectedData.replyTo = false;
                  },
                  child: Icon(
                    Icons.close,
                    size: 15,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 15.0),
            child: Text(
              message.message,
              style: AppTheme.body2,
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}