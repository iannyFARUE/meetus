import 'package:flutter/material.dart';

class SignUpVerificationScreen extends StatefulWidget {
  static final routeName = "/sign-up-verification-screen";
  
  SignUpVerificationScreen({Key key}) : super(key: key);

  @override
  _SignUpVerificationScreenState createState() =>
      _SignUpVerificationScreenState();
}

class _SignUpVerificationScreenState extends State<SignUpVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text('My Text'),
      ),
    );
  }
}
