import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class CustomRoundedBars extends StatelessWidget {
  final List<Spends> data;
  final bool animate;

  CustomRoundedBars(this.data, {this.animate = true});

  // /// Creates a [BarChart] with custom rounded bars.
  // factory CustomRoundedBars.withSampleData() {
  //   return CustomRoundedBars(
  //     _createSampleData(data),
  //     // Disable animations for image tests.
  //     animate: true,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    print("sd>>> ${data.length}");
    return charts.BarChart(
      _createSampleData(data),
      animate: animate,
      defaultRenderer: new charts.BarRendererConfig(
          // By default, bar renderer will draw rounded bars with a constant
          // radius of 100.
          // To not have any rounded corners, use [NoCornerStrategy]
          // To change the radius of the bars, use [ConstCornerStrategy]
          cornerStrategy: const charts.ConstCornerStrategy(30)),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<Spends, String>> _createSampleData(
      List<Spends> data) {
    return [
      new charts.Series<Spends, String>(
        id: 'Spends',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (Spends sales, _) => sales.date,
        measureFn: (Spends sales, _) => sales.amount,
        data: data,
      )
    ];
  }
}

class Spends {
  final String date;
  final int amount;

  Spends(this.date, this.amount);
}
