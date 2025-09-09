import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarHorizontal extends StatefulWidget {
  /// Creates customized Column chart
  const BarHorizontal({Key? key}) : super(key: key);

  @override
  State<BarHorizontal> createState() => _BarHorizontalState();
}

class _BarHorizontalState extends State<BarHorizontal> {
  _BarHorizontalState();

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      title: ChartTitle(text: 'PC vendor shipments - 2015 Q1'),
      primaryXAxis: CategoryAxis(
        majorGridLines: const MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
          labelFormat: '{value}M',
          title: AxisTitle(text: 'Shipments in million'),
          majorGridLines: const MajorGridLines(width: 0),
          majorTickLines: const MajorTickLines(size: 0)),
      series: <CartesianSeries<ChartSampleData, String>>[
        BarSeries<ChartSampleData, String>(
          onCreateRenderer: (ChartSeries<ChartSampleData, String> series) =>
              _CustomColumnSeriesRenderer(),
          dataLabelSettings: const DataLabelSettings(
              isVisible: true, labelAlignment: ChartDataLabelAlignment.middle),
          dataSource: <ChartSampleData>[
            ChartSampleData(x: 'HP Inc', y: 12.54),
            ChartSampleData(x: 'Lenovo', y: 13.46),
            ChartSampleData(x: 'Dell', y: 9.18),
            ChartSampleData(x: 'Apple', y: 4.56),
            ChartSampleData(x: 'Asus', y: 5.29),
          ],
          width: 0.8,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
        )
      ],
    );
  }
}

class _CustomColumnSeriesRenderer extends BarSeriesRenderer<ChartSampleData, String> {
  _CustomColumnSeriesRenderer();

  @override
  BarSegment<ChartSampleData, String> createSegment() {
    return _ColumnCustomPainter();
  }
}

class _ColumnCustomPainter extends BarSegment<ChartSampleData, String> {
  final colorList = [
    const Color.fromRGBO(53, 92, 125, 1),
    const Color.fromRGBO(192, 108, 132, 1),
    const Color.fromRGBO(246, 114, 128, 1),
    const Color.fromRGBO(248, 177, 149, 1),
    const Color.fromRGBO(116, 180, 155, 1)
  ];

  @override
  Paint getFillPaint() {
    final Paint customerFillPaint = Paint();
    customerFillPaint.isAntiAlias = false;
    customerFillPaint.color = colorList[currentSegmentIndex ?? 0];
    customerFillPaint.style = PaintingStyle.fill;
    return customerFillPaint;
  }
}

class ChartSampleData {
  ChartSampleData({this.x, this.y});

  final dynamic x;
  final num? y;
}