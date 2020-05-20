import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String labelText;

  CustomButton(this.labelText);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.1,
      ),
      height: MediaQuery.of(context).size.height * 0.06,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white,
      ),
      child: Center(
          child: Text(
        labelText,
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
    );
  }
}
