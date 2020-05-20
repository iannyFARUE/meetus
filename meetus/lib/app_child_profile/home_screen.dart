import 'package:flutter/material.dart';
import 'package:schoolbookapp/app_child_profile/widgets/class_performance_view.dart';
import 'package:schoolbookapp/app_child_profile/widgets/home_work_list_view.dart';
import 'package:schoolbookapp/widgets/title_view.dart';

class HomeScreen extends StatefulWidget {
  final AnimationController animationController;

  HomeScreen({Key key, this.animationController}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    addAllListData();
  }

  void addAllListData() {
    const int count = 9;
    listViews.add(
      TitleView(
        titleTxt: 'Recent Home work',
        subTxt: 'Details',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: widget.animationController,
            curve: Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn),
          ),
        ),
        animationController: widget.animationController,
      ),
    );

    listViews.add(
      HomeWorkListView(
        mainScreenAnimation: Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: widget.animationController,
            curve: Interval((1 / count) * 3, 1.0, curve: Curves.fastOutSlowIn),
          ),
        ),
        mainScreenAnimationController: widget.animationController,
      ),
    );

    listViews.add(
      TitleView(
        titleTxt: 'Class performance',
        subTxt: 'Details',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: widget.animationController,
            curve: Interval((1 / count) * 4, 1.0, curve: Curves.fastOutSlowIn),
          ),
        ),
        animationController: widget.animationController,
      ),
    );

    listViews.add(
      new ClassPerformanceView(
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: widget.animationController,
            curve: Interval((1 / count) * 4, 1.0, curve: Curves.fastOutSlowIn),
          ),
        ),
        animationController: widget.animationController,
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listViews.length,
      padding: const EdgeInsets.only(top: 8),
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        widget.animationController.forward();
        return listViews[index];
      },
    );

    /*Container(
      //color: AppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            getMainListViewUI(),
            //getAppBarUI(),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            )
          ],
        ),
      ),
    );*/
  }

  Widget getMainListViewUI() {
    return FutureBuilder<bool>(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox();
        } else {
          return ListView.builder(
            controller: scrollController,
            itemCount: listViews.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              widget.animationController.forward();
              return listViews[index];
            },
          );
        }
      },
    );
  }
}
