import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  final AnimationController animationController; //not used at the moment

  const TestScreen({Key key, this.animationController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Test Screen"),
    );
  }
}