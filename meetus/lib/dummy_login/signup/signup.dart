import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:schoolbookapp/app_chat_groups/models/user.dart';
import 'package:schoolbookapp/app_chat_groups/services/firebase/user_service.dart';
import 'package:schoolbookapp/dummy_login/widgets/custom_button.dart';
import 'package:schoolbookapp/dummy_login/widgets/custom_textfield.dart';
import 'package:schoolbookapp/dummy_login/services/auth.dart';
import 'package:kiwi/kiwi.dart' as kiwi;

class Signup extends StatefulWidget {
  static const routeName = "/signup";

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  void initState() {
    super.initState();
    // registerNotification();
    configLocalNotification();
  }

  // final _formKey = GlobalKey<FormState>();
  final _user = User();
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthServices authServices = AuthServices();
  final UserService _userService = kiwi.Container().resolve<UserService>();
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging();
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
    

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Schoolbook"),
      ),
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          // width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Colors.red, Colors.red],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          )),
          child: Stack(
            children: <Widget>[
              Opacity(
                opacity: 0.2,
                child: Container(
                  width: double.infinity,
                  // decoration: BoxDecoration(
                  //     image: DecorationImage(
                  //   image: AssetImage('assets/images/library_2.jpg'),
                  //   fit: BoxFit.cover,
                  // )),
                ),
              ),
              Column(children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * 0.1),
                  child: Center(
                    child: Text(
                      "SIGN UP",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.width * 0.1),
                Builder(
                  builder: (context) => Form(
                    key: _formKey,
                    child: Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Column(
                        children: <Widget>[
                          CustomTextField(labelText: "Email", user: _user),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          CustomTextField(labelText: "Password", user: _user),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          InkWell(
                            child: CustomButton("Sign Up"),
                            hoverColor: Colors.red,
                            onTap: () async {
                              final form = _formKey.currentState;
                              if (form.validate()) {
                                form.save();
                                print(_user.email);
                                dynamic result = await authServices
                                    .registerWithEmailAndPassword(
                                        _user.email.trim(),
                                        _user.password.trim());

                                if (result == null) {
                                  print("In null");
                                } else {
                                  print("In user added");
                                  await _userService
                                      .addUser(_user.email, _user)
                                      .then((value) {
                                    registerNotification();
                                  }, onError: (error) {});
                                }
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }

  void registerNotification() {
    print("Registering notifications");
    firebaseMessaging.requestNotificationPermissions();

    firebaseMessaging.configure(onMessage: (Map<String, dynamic> message) {
      print('onMessage: $message');

      Platform.isAndroid
          ? showNotification(message['notification'])
          : showNotification(message['aps']['alert']);
      return;
    }, onResume: (Map<String, dynamic> message) {
      print('onResume: $message');
      return;
    }, onLaunch: (Map<String, dynamic> message) {
      print('onLaunch: $message');
      return;
    });

    firebaseMessaging.getToken().then((token) {
      print('token: $token');
      Firestore.instance
          .collection('users')
          .document(_user.email)
          .updateData({'pushToken': token});
    }).catchError((err) {
      print(err);
    });
  }

  void showNotification(message) async {
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
      Platform.isAndroid
          ? 'com.example.schoolbookapp'
          : 'com.duytq.flutterchatdemo',
      'Flutter chat demo',
      'your channel description',
      playSound: true,
      enableVibration: true,
      importance: Importance.Max,
      priority: Priority.High,
    );
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);

    print(message);
//    print(message['body'].toString());
//    print(json.encode(message));

    await flutterLocalNotificationsPlugin.show(0, message['title'].toString(),
        message['body'].toString(), platformChannelSpecifics,
        payload: json.encode(message));

//    await flutterLocalNotificationsPlugin.show(
//        0, 'plain title', 'plain body', platformChannelSpecifics,
//        payload: 'item x');
  }

  void configLocalNotification() {
    print("Configuring local storage");
    var initializationSettingsAndroid =
        new AndroidInitializationSettings('app_icon');
    var initializationSettingsIOS = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }
}
