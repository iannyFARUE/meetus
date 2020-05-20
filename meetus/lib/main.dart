import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:schoolbookapp/app_auth/sign_in_screen.dart';
import 'package:schoolbookapp/app_auth/sign_up_screen.dart';
import 'package:schoolbookapp/app_auth/sign_up_verification_screen.dart';
import 'package:schoolbookapp/app_chat_groups/chats_screen.dart';
import 'package:schoolbookapp/app_home_screen.dart';
import 'package:schoolbookapp/app_theme.dart';
import 'package:schoolbookapp/app_posts/providers/posts_provider.dart';
import 'package:schoolbookapp/configs/app_config.dart';
import 'package:schoolbookapp/configs/file_config_service.dart';

import 'app_chat_groups/injection/dependency_injection.dart';
import 'app_chat_groups/providers/users.dart';
import 'package:schoolbookapp/app_auth/providers/auth_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final FirebaseApp app = await FirebaseApp.configure(
    name: 'db2',
    options: const FirebaseOptions(
      googleAppID: '1:169153081838:android:e9c520fc840c26cf17deff',
      apiKey: 'AIzaSyDmejyLjQCvhEzRah-3SP9lihs4CnTYk7c',
      databaseURL: 'https://schoolbook-app.firebaseio.com',
    ),
  );
  FileConfigService().registerConfig(Config.appProperties());
  initKiwi();
  printCurrentProfile();

  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) => runApp(MyApp(app: app)));
}

void printCurrentProfile() {
  debugPrint(Config.appProperties().toJson().toString());
}

class MyApp extends StatelessWidget {
  final FirebaseApp app;

  MyApp({this.app});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness:
          Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.grey,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: AuthProvider(),
        ),
        ChangeNotifierProxyProvider<AuthProvider, PostsProvider>(
          create: (_) => PostsProvider(),
          update: (_, auth, previousPosts) => previousPosts..authToken = auth.token,
        ),
        // StreamProvider<User>.value(value: AuthServices().user),
        ChangeNotifierProvider.value(
          value: Users(),
        ),
      ],
      child: Consumer<AuthProvider>(
        builder: (ctx, auth, child) => MaterialApp( 
          theme: ThemeData(
            //primarySwatch: Colors.blue,
            textTheme: AppTheme.textTheme,
            platform: TargetPlatform.iOS,
          ),
          home: auth.isAuth ? AppHomeScreen() : SignInScreen(),
          routes: {
            // '/': (context) => AppHomeScreen(app),
            //'/': (context) => Login(app),
            //Login.routeName: (context) => Login(app),
            //Signup.routeName: (context) => Signup(),
            SignInScreen.routeName: (ctx) => SignInScreen(),
            SignUpScreen.routeName: (ctx) => SignUpScreen(),
            SignUpVerificationScreen.routeName: (ctx) =>
                SignUpVerificationScreen(),
            //inside app

            ChatsScreen.routeName: (context) => ChatsScreen(),

            //school posts routes
          },
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
