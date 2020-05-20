import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:schoolbookapp/app_child_profile/models/class_performance_data.dart';
import 'package:schoolbookapp/app_theme.dart';

class ClassPerformanceChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;
  //final AnimationController animationController;
  //final Animation animation;

  ClassPerformanceChart(this.seriesList, {this.animate});

  /// Creates a [LineChart] with sample data and no transition.
  factory ClassPerformanceChart.withSampleData() {
    return new ClassPerformanceChart(
      ClassPerformanceData.createSampleData(),
      animate: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      padding: EdgeInsets.only(left: 10.0),
      decoration: BoxDecoration(
        color: AppTheme.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: AppTheme.grey.withOpacity(0.2),
              offset: Offset(1.1, 1.1),
              blurRadius: 10.0),
        ],
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 8.0),
            child: Column(
              children: <Widget>[
                Container(
                  child: Text(
                    'Child Performance Chart',
                    style: AppTheme.title,
                  ),
                ),
                Container(
                  child: Text(
                    'Child avg per class avg',
                    style: AppTheme.caption,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: charts.LineChart(
              seriesList,
              defaultRenderer: charts.LineRendererConfig(
                includeArea: true,
                stacked: true,
              ),
              animate: animate,
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Class Average',
                  style: AppTheme.caption,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  'Child Average',
                  style: AppTheme.caption,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
