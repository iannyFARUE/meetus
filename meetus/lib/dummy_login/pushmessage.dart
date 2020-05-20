import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:schoolbookapp/dummy_login/Mossage.dart';

class PushMessage extends StatefulWidget {
  @override
  _PushMessageState createState() => _PushMessageState();
}

class _PushMessageState extends State<PushMessage> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  List<Mossage> mossage = [];

  @override
  void initState() {
    super.initState();
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("OnMessage $message");

        final notification = message['notifications'];
        setState(() {
          mossage.add(Mossage(
              body: notification['boby'], title: notification['title']));
        });
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("OnLaunch $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("OnResume $message");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: mossage.map(buildMessage).toList(),
    );
  }

  Widget buildMessage(Mossage mossage) =>
      ListTile(title: Text("Ian"), subtitle: Text(mossage.body));
}
