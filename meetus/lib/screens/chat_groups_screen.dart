import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:schoolbookapp/app_chat_groups/widgets/chat_group_item.dart';
import 'package:schoolbookapp/app_chat_groups/models/chat_group.dart';
import 'package:schoolbookapp/app_theme.dart';
import 'package:schoolbookapp/configs/storage_services.dart';
import 'package:schoolbookapp/utils/animated_loader/app_loader.dart';
import 'package:schoolbookapp/utils/sleep_test.dart';
import 'package:schoolbookapp/widgets/app_bar_ui.dart';
import 'package:schoolbookapp/widgets/my_children_list.dart';

class ChatGroupsScreen extends StatefulWidget {
  final AnimationController animationController;
  final FirebaseApp app;

  ChatGroupsScreen({
    Key key,
    this.animationController,
    this.app,
  }) : super(key: key);

  @override
  _ChatGroupsScreenState createState() => _ChatGroupsScreenState();
}

class _ChatGroupsScreenState extends State<ChatGroupsScreen> {
  var username;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    StorageService.getStringAsync(StorageService.USERNAME).then(preCheck);
  }

  preCheck(String name) {
    setState(() {
      this.username = name;
    });
  }

  final List<ChatGroup> chatGroups = [];

  @override
  Widget build(BuildContext context) {
    print("--------my username ----$username");
    return Scaffold(
      backgroundColor: AppTheme.white,
      body: Column(
        children: <Widget>[
          AppBarUI(),
          MyChildrenList(),
          Expanded(
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: AppTheme.background,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                    child: StreamBuilder<QuerySnapshot>(
                      stream: Firestore.instance
                          .collection('users')
                          .document("$username")
                          .collection("groups")
                          .snapshots(),
                      builder: (
                        BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot,
                      ) {
                        if (!snapshot.hasData)
                          return Center(child: AppLoader());
                        QuerySnapshot querySnapshot = snapshot.data;

                        List<ChatGroup> list = querySnapshot.documents
                            .map((doc) => ChatGroup.fromJson(
                                Map<String, dynamic>.from(doc.data)))
                            .toList();

                        return list.length == 0
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'You have no chat groups to show.',
                                      style: AppTheme.body1,
                                    ),
                                    SizedBox(
                                      height: 8.0,
                                    ),
                                    FlatButton(
                                      onPressed: () async {
                                        setState(() {
                                          isLoading = true;
                                        });
                                        await SleepTest().sleep();
                                        setState(() {
                                          isLoading = false;
                                        });
                                      },
                                      child: isLoading ? AppLoader() : Text('Click here!', style: AppTheme.caption,),
                                    )
                                  ],
                                ),
                              )
                            : ListView.builder(
                                itemCount: list.length,
                                itemBuilder: (context, i) {
                                  //print(list[i].males);
                                  return ChatGroupItem(list[i], widget.app);
                                },
                              );
                      },
                    ),
                  ),
                ),
                Container(
                  height: 30,
                  decoration: BoxDecoration(
                    color: AppTheme.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                    boxShadow: <BoxShadow>[
                      /*BoxShadow(
                        color: AppTheme.nearlyDarkBlue.withOpacity(0.4),
                        offset: const Offset(0, 2),
                        blurRadius: 8.0,
                      ),*/
                      BoxShadow(
                        color: AppTheme.nearlyDarkBlue.withOpacity(0.4),
                        offset: const Offset(0, -2),
                        blurRadius: 8.0,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Chat Groups',
                        style: TextStyle(
                          fontFamily: AppTheme.fontName,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          letterSpacing: 0.5,
                          color: AppTheme.lightText,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
