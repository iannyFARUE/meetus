import 'package:flutter/material.dart';
import 'package:schoolbookapp/app_chat_groups/models/user.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final User user;
  final String property;

  CustomTextField({this.labelText, this.user, this.property});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  void toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  var _isHidden = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.labelText == "Password" ? _isHidden : false,
      decoration: InputDecoration(
          helperText: '',
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(color: Colors.white)),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(color: Colors.white)),
          prefixIcon: Icon(
            widget.labelText == "Password" ||
                    widget.labelText == "Verify Password"
                ? Icons.lock
                : widget.labelText == "Email" ? Icons.email : null,
            color: Colors.white,
            size: 30.0,
          ),
          errorStyle: TextStyle(
            color: Colors.white,
          ),
          errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(color: Colors.white)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(color: Colors.white)),
          suffixIcon: widget.labelText == "Password" ||
                  widget.labelText == "Verify Password"
              ? IconButton(
                  icon: Icon(
                    _isHidden ? Icons.visibility_off : Icons.visibility,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  onPressed: toggleVisibility,
                )
              : null,
          labelText: widget.labelText,
          labelStyle: TextStyle(color: Colors.white, fontSize: 18)),
      onSaved: (val) {
        if (widget.labelText == "Password") widget.user.password = val;
        if (widget.labelText == "Email") widget.user.email = val.trim();
      },
      validator: (val) {
        return val.isEmpty
            ? "${widget.labelText} field should not be empty"
            : null;
      },
    );
  }
}
