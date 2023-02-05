import 'package:fl_chart/fl_chart.dart';
import 'package:my_manager_app/models/spent.dart';

extension ListSpentExtension on List<Spent> {
  List<BarChartGroupData> getBars() {
    final date = DateTime.now();
    final startWeek = date.subtract(Duration(days: date.weekday));
    final endWeek =
        date.add(Duration(days: DateTime.daysPerWeek - date.weekday + 1));

    final filterList = where((spent) =>
        spent.date.isAfter(startWeek) && spent.date.isBefore(endWeek));

    final mapReport = {
      1: 0.0,
      2: 0.0,
      3: 0.0,
      4: 0.0,
      5: 0.0,
      6: 0.0,
      7: 0.0,
    };

    for (final spent in filterList) {
      mapReport[spent.date.weekday] =
          (mapReport[spent.date.weekday] ?? 0.0) + spent.amount;
    }
    List<BarChartGroupData> res = [];
    mapReport.forEach((key, value) {
      res.add(
        BarChartGroupData(
          x: key,
          barRods: [BarChartRodData(toY: value)],
        ),
      );
    });

    return res;
  }
}
