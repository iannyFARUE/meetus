import 'package:flutter/material.dart';
import 'package:schoolbookapp/app_posts/models/comment.dart';

class MessageTextfield extends StatefulWidget {
  @override
  _MessageTextfieldState createState() => _MessageTextfieldState();
}

class _MessageTextfieldState extends State<MessageTextfield> {
  final _formKey = GlobalKey<FormState>();

  final _comment = Comment();
  @override
  Widget build(BuildContext context) {
    //var posts = Provider.of<Posts>(context);
    return Form(
      key: _formKey,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              // padding: EdgeInsets.only(left: 10.0),
              child: TextFormField(
                // autofocus: true,
                decoration: InputDecoration(
                  helperText: '',
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(color: Color(0xFFFAFAFA))),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(color: Color(0xFFFAFAFA))),
                  errorStyle: TextStyle(
                    color: Colors.red,
                  ),
                  errorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(color: Colors.red)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(color: Colors.red)),
                  // suffixIcon:
                  labelText: "Send message.......",
                  labelStyle: TextStyle(color: Colors.black54),
                  fillColor: Colors.grey[200],
                  filled: true,
                ),
                onSaved: (val) {
                  setState(() {
                    _comment.message = val;
                  });
                },
                validator: (val) {
                  return val.isEmpty ? "field should not be empty" : null;
                },
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 25, right: 3, top: 5),
            child: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              child: IconButton(
                icon: Icon(
                  Icons.send,
                  color: Colors.white,
                  // size: 40.0,
                ),
                onPressed: () {
                  final form = _formKey.currentState;

                  if (form.validate()) {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text('Comment saved successfully....'),
                      duration: Duration(seconds: 1),
                    ));
                    form.save();
                    FocusScope.of(context).unfocus();
                    form.reset();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
