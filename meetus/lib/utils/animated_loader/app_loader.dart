import 'dart:math';

import 'package:flutter/material.dart';
import 'package:schoolbookapp/app_theme.dart';
import 'package:schoolbookapp/utils/animated_loader/dot.dart';

class AppLoader extends StatefulWidget {
  final double radius;
  final double dotRadius;
  AppLoader({this.radius = 15.0, this.dotRadius = 5.0});

  @override
  _AppLoaderState createState() => _AppLoaderState();
}

class _AppLoaderState extends State<AppLoader>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animationRotation;
  Animation<double> animationRadiusIn;
  Animation<double> animationRadiusOut;
  double radius;
  double dotRadius;

  @override
  void initState() {
    super.initState();
    radius = widget.radius;
    dotRadius = widget.dotRadius;

    animationController = AnimationController(
      lowerBound: 0.0,
      upperBound: 1.0,
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    animationRotation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.0, 1.0, curve: Curves.linear),
      ),
    );
    animationRadiusIn = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.75, 1.0, curve: Curves.elasticIn),
      ),
    );
    animationRadiusOut = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.0, 0.25, curve: Curves.elasticOut),
      ),
    );
    animationController.addListener(() {
      setState(() {
        if (animationController.value >= 0.75 &&
            animationController.value <= 1.0) {
          radius = animationRadiusIn.value * widget.radius;
        } else if (animationController.value >= 0.0 &&
            animationController.value <= 0.25) {
          radius = animationRadiusOut.value * widget.radius;
        }
      });
    });
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {}
    });
    animationController.repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.radius * 2,
      width: widget.radius * 2,
      child: Center(
        child: RotationTransition(
          turns: animationRotation,
          child: Stack(
            children: <Widget>[
              Dot(
                radius: radius,
                color: AppTheme.nearlyDarkBlue,
              ),
              Transform.translate(
                offset: Offset(
                  radius * cos(pi / 4),
                  radius * sin(pi / 4),
                ),
                child: Dot(
                  radius: dotRadius,
                  color: Colors.red,
                ),
              ),
              Transform.translate(
                offset: Offset(
                  radius * cos(2 * pi / 4),
                  radius * sin(2 * pi / 4),
                ),
                child: Dot(
                  radius: dotRadius,
                  color: Colors.red,
                ),
              ),
              Transform.translate(
                offset: Offset(
                  radius * cos(3 * pi / 4),
                  radius * sin(3 * pi / 4),
                ),
                child: Dot(
                  radius: dotRadius,
                  color: Colors.red,
                ),
              ),
              Transform.translate(
                offset: Offset(
                  radius * cos(4 * pi / 4),
                  radius * sin(4 * pi / 4),
                ),
                child: Dot(
                  radius: dotRadius,
                  color: Colors.red,
                ),
              ),
              Transform.translate(
                offset: Offset(
                  radius * cos(5 * pi / 4),
                  radius * sin(5 * pi / 4),
                ),
                child: Dot(
                  radius: dotRadius,
                  color: Colors.red,
                ),
              ),
              Transform.translate(
                offset: Offset(
                  radius * cos(6 * pi / 4),
                  radius * sin(6 * pi / 4),
                ),
                child: Dot(
                  radius: dotRadius,
                  color: Colors.red,
                ),
              ),
              Transform.translate(
                offset: Offset(
                  radius * cos(7 * pi / 4),
                  radius * sin(7 * pi / 4),
                ),
                child: Dot(
                  radius: dotRadius,
                  color: Colors.red,
                ),
              ),
              Transform.translate(
                offset: Offset(
                  radius * cos(8 * pi / 4),
                  radius * sin(8 * pi / 4),
                ),
                child: Dot(
                  radius: dotRadius,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
