import 'package:charts_flutter/flutter.dart' as charts;

class ClassPerformanceData {

  final int year;
  final int sales;

  ClassPerformanceData(this.year, this.sales);

  static List<charts.Series<ClassPerformanceData, int>> createSampleData() {
    final myFakeDesktopData = [
      new ClassPerformanceData(0, 5),
      new ClassPerformanceData(1, 25),
      new ClassPerformanceData(2, 100),
      new ClassPerformanceData(3, 75),
    ];

    var myFakeTabletData = [
      new ClassPerformanceData(0, 10),
      new ClassPerformanceData(1, 50),
      new ClassPerformanceData(2, 200),
      new ClassPerformanceData(3, 150),
    ];

    var myFakeMobileData = [
      new ClassPerformanceData(0, 15),
      new ClassPerformanceData(1, 75),
      new ClassPerformanceData(2, 300),
      new ClassPerformanceData(3, 225),
    ];

    return [
      new charts.Series<ClassPerformanceData, int>(
        id: 'Desktop',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (ClassPerformanceData sales, _) => sales.year,
        measureFn: (ClassPerformanceData sales, _) => sales.sales,
        data: myFakeDesktopData,
      ),
      new charts.Series<ClassPerformanceData, int>(
        id: 'Tablet',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (ClassPerformanceData sales, _) => sales.year,
        measureFn: (ClassPerformanceData sales, _) => sales.sales,
        data: myFakeTabletData,
      ),
      new charts.Series<ClassPerformanceData, int>(
        id: 'Mobile',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (ClassPerformanceData sales, _) => sales.year,
        measureFn: (ClassPerformanceData sales, _) => sales.sales,
        data: myFakeMobileData,
      ),
    ];
  }
}