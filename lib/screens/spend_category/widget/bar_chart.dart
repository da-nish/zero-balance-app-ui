import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class CustomRoundedBars extends StatelessWidget {
  final List<Spends> data;
  final bool animate;

  CustomRoundedBars(this.data, {this.animate = true});

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      _createSampleData(data),
      animate: animate,
      defaultRenderer: new charts.BarRendererConfig(
          cornerStrategy: const charts.ConstCornerStrategy(30)),
    );
  }

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
