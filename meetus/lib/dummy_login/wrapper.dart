import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schoolbookapp/app_chat_groups/models/user.dart';
import 'package:schoolbookapp/app_home_screen.dart';
import 'package:schoolbookapp/dummy_login/login/login.dart';

class Wrapper extends StatelessWidget {
  static const String routeName = "/wrapper";

  final FirebaseApp app;

  Wrapper(this.app);
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    // print(user);
    // print("Test");

    if (user == null) {
      return Login(app);
    } else {
      return AppHomeScreen();
    }
  }
}
