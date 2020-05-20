import 'package:flutter/material.dart';
import 'package:schoolbookapp/app_auth/sign_in_screen.dart';
import 'package:schoolbookapp/app_auth/sign_up_screen.dart';
import 'package:schoolbookapp/app_theme.dart';
import 'package:schoolbookapp/utils/network_image.dart';

class AppLandingScreen extends StatelessWidget {
  static final routeName = "/app-home-screen";
  static const SCHOOLBOOKLOGO =
      "http://objectnation.co.zw/dentalfirst/assets/img/object_nation.png";
  const AppLandingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: AppTheme.nearlyWhite,
        child: Column(
          children: <Widget>[
            const SizedBox(height: kToolbarHeight),
            Text(
              "SchoolBook",
              style: TextStyle(
                color: AppTheme.dark_grey.withOpacity(0.8),
                fontWeight: FontWeight.w400,
                fontSize: 28,
                fontFamily: AppTheme.fontName,
              ),
            ),
            Text.rich(
              TextSpan(children: [
                TextSpan(text: "Hand crafted with ", style: AppTheme.body2),
                TextSpan(text: "passion", style: AppTheme.caption),
              ]),
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.background,//AppTheme.dark_grey.withOpacity(0.15),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(60.0),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Center(
                        child: PNetworkImage(SCHOOLBOOKLOGO),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 8.0),
                      child: RaisedButton(
                        highlightElevation: 0,
                        elevation: 5,
                        child: Text("Create an Account"),
                        textColor: AppTheme.nearlyDarkBlue,
                        color: Colors.white,
                        onPressed: () => Navigator.pushNamed(context, SignUpScreen.routeName),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 8.0),
                      child: RaisedButton(
                        highlightElevation: 0,
                        elevation: 5,
                        child: Text("Sign in"),
                        textColor: Colors.white,
                        color: AppTheme.nearlyDarkBlue,
                        onPressed: () => Navigator.pushReplacementNamed(context, SignInScreen.routeName),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text.rich(
                      TextSpan(children: [
                        TextSpan(text: "Need any help? "),
                        WidgetSpan(
                            child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Click Here",
                            style: AppTheme.caption,
                          ),
                        ))
                      ]),
                      style: AppTheme.body1,
                    ),
                    const SizedBox(height: 30.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
