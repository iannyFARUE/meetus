import 'package:flutter/material.dart';
import 'package:schoolbookapp/app_child_profile/widgets/class_performance_chart.dart';

class ClassPerformanceView extends StatelessWidget {
  final AnimationController animationController;
  final Animation animation;

  ClassPerformanceView({this.animation, this.animationController});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: new Matrix4.translationValues(
              0.0,
              30 * (1.0 - animation.value),
              0.0,
            ),
            child: ClassPerformanceChart.withSampleData(),
          ),
        );
      },
    );
  }
}
