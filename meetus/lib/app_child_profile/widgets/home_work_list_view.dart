import 'package:flutter/material.dart';
import 'package:schoolbookapp/app_child_profile/models/home_work_list.dart';
import 'package:schoolbookapp/app_theme.dart';
import 'package:schoolbookapp/utils/hex_color.dart';

class HomeWorkListView extends StatefulWidget {
  const HomeWorkListView({
    Key key,
    this.mainScreenAnimationController,
    this.mainScreenAnimation,
  }) : super(key: key);

  final AnimationController mainScreenAnimationController;
  final Animation<dynamic> mainScreenAnimation;

  @override
  _HomeWorkListViewState createState() => _HomeWorkListViewState();
}

class _HomeWorkListViewState extends State<HomeWorkListView>
    with TickerProviderStateMixin {
  AnimationController animationController;
  List<HomeWorkList> homeWorkList = HomeWorkList.tabIconsList;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.mainScreenAnimationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: widget.mainScreenAnimation,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 30 * (1.0 - widget.mainScreenAnimation.value), 0.0),
            child: Container(
              height: 216,
              width: double.infinity,
              child: ListView.builder(
                padding: const EdgeInsets.only(
                    top: 0, bottom: 0, right: 16, left: 5),
                itemCount: homeWorkList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final int count =
                      homeWorkList.length > 10 ? 10 : homeWorkList.length;
                  final Animation<double> animation =
                      Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                              parent: animationController,
                              curve: Interval((1 / count) * index, 1.0,
                                  curve: Curves.fastOutSlowIn)));
                  animationController.forward();

                  return MealsView(
                    homeWorkList: homeWorkList[index],
                    animation: animation,
                    animationController: animationController,
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class MealsView extends StatelessWidget {
  const MealsView(
      {Key key, this.homeWorkList, this.animationController, this.animation})
      : super(key: key);

  final HomeWorkList homeWorkList;
  final AnimationController animationController;
  final Animation<dynamic> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(
                100 * (1.0 - animation.value), 0.0, 0.0),
            child: SizedBox(
              width: 130,
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 32, left: 8, right: 8, bottom: 16),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: HexColor(homeWorkList.endColor)
                                  .withOpacity(0.6),
                              offset: const Offset(1.1, 4.0),
                              blurRadius: 8.0),
                        ],
                        gradient: LinearGradient(
                          colors: <HexColor>[
                            HexColor(homeWorkList.startColor),
                            HexColor(homeWorkList.endColor),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(8.0),
                          bottomLeft: Radius.circular(8.0),
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(54.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 54, left: 8, right: 8, bottom: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            FittedBox(
                              child: Text(
                                homeWorkList.titleTxt,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: AppTheme.fontName,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  letterSpacing: 0.2,
                                  color: AppTheme.white,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 8, bottom: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      homeWorkList.meals.join('\n'),
                                      style: TextStyle(
                                        fontFamily: AppTheme.fontName,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10,
                                        letterSpacing: 0.2,
                                        color: AppTheme.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Status:',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: AppTheme.fontName,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    letterSpacing: 0.2,
                                    color: AppTheme.white,
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppTheme.nearlyWhite,
                                    shape: BoxShape.circle,
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                        color: AppTheme.nearlyBlack
                                            .withOpacity(0.4),
                                        offset: Offset(8.0, 8.0),
                                        blurRadius: 8.0,
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Icon(
                                      homeWorkList.status == 'pending'
                                          ? Icons.close
                                          : homeWorkList.status ==
                                                  'partially-done'
                                              ? Icons.done
                                              : Icons.done_all,
                                      color: HexColor(homeWorkList.endColor),
                                      size: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      width: 84,
                      height: 84,
                      decoration: BoxDecoration(
                        color: AppTheme.nearlyWhite.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 8,
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child: Image.asset(homeWorkList.imagePath),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
