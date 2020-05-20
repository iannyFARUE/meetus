import 'package:flutter/material.dart';
import 'package:schoolbookapp/app_theme.dart';
import 'package:schoolbookapp/models/tabicon_data.dart';
import 'package:schoolbookapp/screens/chat_groups_screen.dart';
import 'package:schoolbookapp/screens/child_profile_screen.dart';
import 'package:schoolbookapp/screens/posts_screen.dart';
import 'package:schoolbookapp/screens/test_screen.dart';
import 'package:schoolbookapp/screens/test_screen_1.dart';
import 'package:schoolbookapp/screens/test_screen_3.dart';
import 'package:schoolbookapp/widgets/bottom_bar_view.dart';
import 'package:schoolbookapp/widgets/custom_drawer/drawer_user_controller.dart';
import 'package:schoolbookapp/widgets/custom_drawer/home_drawer.dart';

class AppHomeScreen extends StatefulWidget {
  static final routeName = "/app-home-screen";
  @override
  _AppHomeScreenState createState() => _AppHomeScreenState();

  AppHomeScreen();
}

class _AppHomeScreenState extends State<AppHomeScreen>
    with TickerProviderStateMixin {
  AnimationController sliderAnimationController;
  Widget screenView;
  DrawerIndex drawerIndex;
  AnimationController animationController;
  String username;
  List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  Widget tabBody = Container(
    color: AppTheme.background,
  );

  @override
  void initState() {
    drawerIndex = DrawerIndex.HOME;
    tabIconsList.forEach((TabIconData tab) {
      tab.isSelected = false;
    });
    tabIconsList[0].isSelected = true;

    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    tabBody = PostsScreen(animationController: animationController);

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    sliderAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.background,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            animationController: (AnimationController animationController) {
              sliderAnimationController = animationController;
            },
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
            },
            screenView: Container(
              color: AppTheme.background,
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: FutureBuilder<bool>(
                  future: getData(),
                  builder:
                      (BuildContext context, AsyncSnapshot<bool> snapshot) {
                    if (!snapshot.hasData) {
                      return const SizedBox();
                    } else {
                      return Stack(
                        children: <Widget>[
                          tabBody,
                          bottomBar(),
                        ],
                      );
                    }
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  Widget bottomBar() {
    return Column(
      children: <Widget>[
        const Expanded(
          child: SizedBox(),
        ),
        BottomBarView(
          tabIconsList: tabIconsList,
          addClick: () {},
          changeIndex: (int index) {
            if (index == 0) {
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody =
                      PostsScreen(animationController: animationController);
                });
              });
            } else if (index == 1) {
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody = ChatGroupsScreen(
                      animationController: animationController);
                });
              });
            } else if (index == 2) {
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody = ChildProfileScreen();
                });
              });
            } else if (index == 3) {
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody =
                      TestScreen3(animationController: animationController);
                });
              });
            }
          },
        ),
      ],
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      if (drawerIndex == DrawerIndex.HOME) {
        setState(() {
          screenView = TestScreen();
        });
      } else if (drawerIndex == DrawerIndex.Help) {
        setState(() {
          screenView = TestScreen1();
        });
      } else if (drawerIndex == DrawerIndex.FeedBack) {
        setState(() {
          screenView = ChildProfileScreen();
        });
      } else if (drawerIndex == DrawerIndex.Invite) {
        setState(() {
          screenView = TestScreen3();
        });
      } else {
        //do in your way......
      }
    }
  }
}
