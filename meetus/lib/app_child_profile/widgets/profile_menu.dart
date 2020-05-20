import 'package:flutter/material.dart';
import 'package:schoolbookapp/app_child_profile/models/child_menu.dart';
import 'package:schoolbookapp/app_theme.dart';

class ProfileMenu extends StatefulWidget {
  final Function setIndex;
  ProfileMenu({Key key, this.setIndex}) : super(key: key);

  @override
  _ProfileMenuState createState() => _ProfileMenuState();
}

class _ProfileMenuState extends State<ProfileMenu> {
  int selectedIndex = 0;
  final List<ChildMenu> menu = [
    ChildMenu(
      name: 'Home',
      menuIcon: Icons.home,
    ),
    ChildMenu(
      name: 'Home Work',
      menuIcon: Icons.event,
    ),
    ChildMenu(
      name: 'Calendar',
      menuIcon: Icons.event,
    ),
    ChildMenu(
      name: 'Reports',
      menuIcon: Icons.insert_chart,
    ),
    ChildMenu(
      name: 'Account',
      menuIcon: Icons.account_balance,
    ),
    ChildMenu(
      name: 'New Menu',
      menuIcon: Icons.accessible,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 24,
            decoration: BoxDecoration(
              color: AppTheme.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: AppTheme.nearlyDarkBlue.withOpacity(0.4),
                  offset: const Offset(0, -2),
                  blurRadius: 8.0,
                ),
              ],
            ),
          ),
        ),
        Container(
          color: AppTheme.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: menu.length,
                    itemBuilder: (ctx, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                            widget.setIndex(selectedIndex);
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                menu[index].menuIcon, 
                                size: 18,
                                color: index == selectedIndex
                                    ? AppTheme.nearlyDarkBlue
                                    : AppTheme.nearlyBlack,
                              ),
                              Text(
                                menu[index].name,
                                style: TextStyle(
                                  fontWeight: FontWeight.w100,
                                  fontSize: 14,
                                  color: index == selectedIndex
                                      ? AppTheme.nearlyDarkBlue
                                      : AppTheme.nearlyBlack,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        const Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Divider(
            height: 1,
          ),
        )
      ],
    );
  }
}
