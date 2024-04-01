import 'package:company_insight_app/core/helpers/text_transformers.dart';
import 'package:company_insight_app/core/styles/gaps.dart';
import 'package:company_insight_app/core/styles/paddings.dart';
import 'package:company_insight_app/core/widgets/app_card.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../manager/company_finacial_health/company_financial_health_cubit.dart';

class FinancialHealthSection extends StatefulWidget {
  const FinancialHealthSection({
    super.key,
    required this.valuesOverTime,
    required this.title,
    required this.onInfoPressed,
  });

  final List<DateValue> valuesOverTime;
  final String title;
  final VoidCallback onInfoPressed;

  @override
  State<FinancialHealthSection> createState() => _FinancialHealthSectionState();
}

class _FinancialHealthSectionState extends State<FinancialHealthSection> {
  final List<Color> gradientColors = [
    const Color(0xFF5E50FF),
    const Color(0xFF32289A),
  ];

  late final double minY;
  late final double maxY;

  @override
  void initState() {
    minY = getMinValue();
    maxY = getMaxValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings.mediumBottom,
      child: AppCard(
        padding: Paddings.mediumBottomMediumLeft,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.title, style: Theme.of(context).textTheme.titleLarge),
                IconButton(
                  padding: Paddings.mediumAll,
                  onPressed: widget.onInfoPressed,
                  icon: const Icon(Icons.info_outline),
                )
              ],
            ),
            Gaps.medium,
            Padding(
              padding: Paddings.largeRight,
              child: AspectRatio(
                aspectRatio: 1.70,
                child: LineChart(_buildLineChart()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  LineChartData _buildLineChart() {
    return LineChartData(
      lineTouchData: const LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        verticalInterval: 1,
        horizontalInterval: 1,
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: Theme.of(context).colorScheme.surface,
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Theme.of(context).colorScheme.surface,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: bottomTitleWidgets,
            interval: 1,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
            interval: 1,
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(show: true, border: Border.all(color: Theme.of(context).colorScheme.surface)),
      minX: getMinX(),
      maxX: widget.valuesOverTime.length.toDouble() - 1,
      minY: getMinY(),
      maxY: getMaxY(),
      lineBarsData: [
        LineChartBarData(
          spots: getSpots(),
          isCurved: true,
          gradient: LinearGradient(
            colors: [
              ColorTween(begin: gradientColors[0], end: gradientColors[1]).lerp(0.2)!,
              ColorTween(begin: gradientColors[0], end: gradientColors[1]).lerp(0.2)!,
            ],
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                ColorTween(begin: gradientColors[0], end: gradientColors[1]).lerp(0.2)!.withOpacity(0.1),
                ColorTween(begin: gradientColors[0], end: gradientColors[1]).lerp(0.2)!.withOpacity(0.1),
              ],
            ),
          ),
        ),
      ],
    );
  }

  double getMinY() => 0;

  double getMaxY() => 4.0;

  double getMinValue() {
    return widget.valuesOverTime.map((e) => e.value).reduce((a, b) => a < b ? a : b).toDouble();
  }

  double getMaxValue() {
    return widget.valuesOverTime.map((e) => e.value).reduce((a, b) => a > b ? a : b).toDouble();
  }

  double getMinX() {
    return 0;
  }

  double getMaxX() {
    return widget.valuesOverTime.length.toDouble() - 1;
  }

  int getLastYear() {
    return widget.valuesOverTime.map((e) => e.date.year).reduce((a, b) => a > b ? a : b);
  }

  int getFirstYear() {
    return widget.valuesOverTime.map((e) => e.date.year).reduce((a, b) => a < b ? a : b);
  }

  List<FlSpot> getSpots() {
    final lowestYear = getFirstYear();
    final minY = getMinValue();
    final maxY = getMaxValue();
    final difference = maxY - minY;

    return widget.valuesOverTime
        .map((e) => FlSpot((e.date.year - lowestYear).toDouble(), (e.value - minY) / (difference / 4)))
        .toList();
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );

    Widget text;
    final lastItemIndex = widget.valuesOverTime.length - 1;
    final middleItemIndex = lastItemIndex ~/ 2;
    final valueI = value.toInt();
    final year = valueI + getFirstYear();
    final indexToShow = [0, middleItemIndex, lastItemIndex];

    if (indexToShow.contains(valueI)) {
      text = Text(year.toString(), style: style);
    } else {
      text = const Text('', style: style);
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;

    final middleValue = getMinValue() + ((getMaxValue() - getMinValue()) / 2);
    switch (value.toInt()) {
      case 0:
        text = reduceTextValue(getMinValue(), fractionDigits: 1);
        break;
      case 2:
        text = reduceTextValue(middleValue, fractionDigits: 1);
        break;
      case 4:
        text = reduceTextValue(getMaxValue(), fractionDigits: 1);
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }
}
