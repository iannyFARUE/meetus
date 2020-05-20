import 'package:flutter/material.dart';

class ContestTabHeader extends SliverPersistentHeaderDelegate {
  ContestTabHeader(
    this.widget,
  );
  final Widget widget;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return widget;
  }

  @override
  double get maxExtent => 52.0;

  @override
  double get minExtent => 52.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
