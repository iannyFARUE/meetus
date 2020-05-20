import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:schoolbookapp/app_home_screen.dart';
import 'package:schoolbookapp/configs/storage_services.dart';
import 'package:schoolbookapp/dummy_login/services/auth.dart';
import 'package:schoolbookapp/dummy_login/signup/signup.dart';

class Login extends StatefulWidget {
  final FirebaseApp app;
  static final routeName = "/login";

  Login(this.app);

  @override
  State<StatefulWidget> createState() {
    return new LoginState();
  }
}

class LoginState extends State<Login> {
  final TextEditingController _userController = new TextEditingController();
  final TextEditingController _pinController = new TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool isDone = false;
  String error;
  String username;
  String biometric;
  String isRegistered;
  final AuthServices _authService = kiwi.Container().resolve<AuthServices>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isDone
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
            key: _scaffoldKey,
            backgroundColor: Colors.white,
            body: Center(
              child: loginBody(),
            ),
          );
  }

  loginBody() => SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[loginFields()],
        ),
      );

  loginFields() => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
              child: TextField(
                // will disable paste operation
                style: TextStyle(color: Colors.black),

                keyboardType: TextInputType.emailAddress,
                controller: _userController,
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: "Enter your email",
                  labelText: "Email",
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
              child: TextField(
                style: TextStyle(color: Colors.black),
                keyboardType: TextInputType.text,
                controller: _pinController,
                maxLines: 1,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Enter your password",
                  labelText: "Password",
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
              width: double.infinity,
              child: RaisedButton(
                padding: EdgeInsets.all(12.0),
                shape: StadiumBorder(),
                child: Text(
                  "SIGN IN",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blueAccent,
                onPressed: () {
                  _loginRequest();
                },
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            new FlatButton(
                child: Text("create account"),
                onPressed: () {
                  _createAccount();
                }),
          ],
        ),
      );

  //methods
  void _loginRequest() async {
    if (_userController.text.isNotEmpty && _pinController.text.isNotEmpty) {
      username = _userController.text;
      String password = _pinController.text;
      dynamic result =
          await _authService.loginWithEmailAndPassword(username, password);
      setState(() {
        isDone = true;
      });

      if (result == null) {
        setState(() {
          isDone = false;
          error = "Signin failed";
          _userController.text = "";
          _pinController.text = "";
          final snackBar = new SnackBar(content: new Text(error));

          _scaffoldKey.currentState.showSnackBar(snackBar);
        });
      } else {
        await StorageService.putStringAsync(StorageService.USERNAME, username);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => AppHomeScreen()),
        );
      }
    } else {
      final snackBar = new SnackBar(content: new Text("Fill all details"));

      _scaffoldKey.currentState.showSnackBar(snackBar);
    }
  }

  void _createAccount() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Signup()),
    );
  }
}
