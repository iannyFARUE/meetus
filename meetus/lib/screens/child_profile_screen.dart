import 'package:flutter/material.dart';
import 'package:schoolbookapp/app_child_profile/child_account_screen.dart';
import 'package:schoolbookapp/app_child_profile/events_calendar_screen.dart';
import 'package:schoolbookapp/app_child_profile/home_screen.dart';
import 'package:schoolbookapp/app_child_profile/home_work_screen.dart';
import 'package:schoolbookapp/app_child_profile/new_menu_screen.dart';
import 'package:schoolbookapp/app_child_profile/term_reports_screen.dart';
import 'package:schoolbookapp/app_child_profile/widgets/profile_header/profile_header.dart';
import 'package:schoolbookapp/app_child_profile/widgets/profile_menu.dart';
import 'package:schoolbookapp/app_theme.dart';
import 'package:schoolbookapp/utils/contest_tab_header.dart';
import 'package:schoolbookapp/widgets/app_bar_ui.dart';

class ChildProfileScreen extends StatefulWidget {
  const ChildProfileScreen({Key key}) : super(key: key);

  @override
  _ChildProfileScreenState createState() => _ChildProfileScreenState();
}

class _ChildProfileScreenState extends State<ChildProfileScreen>
    with TickerProviderStateMixin {
  int selectedIndex = 0;
  AnimationController animationController;
  final ScrollController _scrollController = ScrollController();

  void setIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.background,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                AppBarUI(),
                Expanded(
                  child: NestedScrollView(
                    controller: _scrollController,
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return <Widget>[
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              return ProfileHeader();
                            },
                            childCount: 1,
                          ),
                        ),
                        SliverPersistentHeader(
                          pinned: true,
                          floating: true,
                          delegate: ContestTabHeader(
                            ProfileMenu(
                              setIndex: setIndex,
                            ),
                          ),
                        ),
                      ];
                    },
                    body: Container(
                      color: AppTheme.background,
                      child: selectedIndex == 0
                          ? HomeScreen(
                              animationController: animationController,
                            )
                          : selectedIndex == 1
                              ? HomeWorkScreen()
                              : selectedIndex == 2
                                  ? EventsCalendarScreen()
                                  : selectedIndex == 3
                                      ? TermReportsScreen()
                                      : selectedIndex == 4
                                          ? ChildAccountScreen()
                                          : NewMenuScreen(),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
