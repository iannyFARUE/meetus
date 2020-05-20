import 'package:flutter/material.dart';
import 'package:schoolbookapp/app_chat_groups/models/user.dart';

class AddUserInGroup extends StatefulWidget {
  @override
  AddUserInGroupState createState() => new AddUserInGroupState();
}

class AddUserInGroupState extends State<AddUserInGroup> {
  final TextEditingController _quantityController = new TextEditingController();

  bool _canSave = false;
  User _data = new User();

  void _setCanSave(bool save) {
    if (save != _canSave) {
      setState(() => _canSave = save);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return new Scaffold(
      appBar: new AppBar(
        title: Text("Add Member", style: TextStyle(color: Colors.white)),
        actions: <Widget>[
          new FlatButton(
              child: new Text('Search',
                  style: theme.textTheme.body1.copyWith(
                      color: _canSave
                          ? Colors.white
                          : new Color.fromRGBO(255, 255, 255, 0.5))),
              onPressed: _canSave
                  ? () {
                      Navigator.of(context).pop(_data);
                    }
                  : null)
        ],
        iconTheme: new IconThemeData(color: Colors.white),
      ),
      body: new Form(
        child: new ListView(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
          children: <Widget>[
            new TextField(
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.emailAddress,
              controller: _quantityController,
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
              onChanged: (String value) {
                if (value != null && value != "") {
                  _data.id = value;
                  _setCanSave(value.isNotEmpty);
                }
              },
            )
          ].toList(),
        ),
      ),
    );
  }
}
