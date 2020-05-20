import 'package:flutter/material.dart';

class Dialogs {
  static information(
    BuildContext context,
    String message, {
    String title,
    String positiveButtonLabel,
    String negativeButtonLabel,
    Function onPositiveButtonPressed,
    Function onNegativeButtonPressed,
    bool dismissible = true,
  }) {
    return showDialog(
        context: context,
        barrierDismissible: dismissible,
        builder: (BuildContext context) {
          return AlertDialog(
            title: title == null
                ? null
                : new Text(
                    title,
                    style: new TextStyle(
                      fontSize: 20.00,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
            content: new Text(message),
            actions: <Widget>[
              new FlatButton(
                onPressed: onNegativeButtonPressed != null
                    ? onNegativeButtonPressed
                    : () {
                        Navigator.of(context).pop();
                      },
                child: new Text(
                  negativeButtonLabel != null
                      ? negativeButtonLabel.toUpperCase()
                      : 'CANCEL',
                ),
              ),
              positiveButtonLabel == null
                  ? null
                  : new FlatButton(
                      onPressed: onPositiveButtonPressed != null
                          ? onPositiveButtonPressed
                          : () {
                              Navigator.of(context).pop();
                            },
                      child: new Text(positiveButtonLabel.toUpperCase()),
                    ),
            ],
          );
        });
  }

  static waiting(
    BuildContext context,
    String message, {
    String title,
    bool dismissible = false,
  }) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.yellow,
              ),
            ));
  }

  static pickOption(
    BuildContext context,
    String message, {
    String title,
    List<SimpleDialogOption> options,
    bool dismissible = false,
  }) {
    return showDialog(
        context: context,
        barrierDismissible: dismissible,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: title == null
                ? null
                : new Text(title,
                    style: new TextStyle(
                      fontSize: 18.0,
                    )),
            children: options,
          );
        });
  }

  static hideProgress(BuildContext context) {
    Navigator.pop(context);
  }
}
