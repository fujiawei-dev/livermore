import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'state.dart';

class CoinsLineChart extends ConsumerStatefulWidget {
  const CoinsLineChart({super.key});

  @override
  ConsumerState<CoinsLineChart> createState() => _CoinsLineChartState();
}

class _CoinsLineChartState extends ConsumerState<CoinsLineChart> {
  @override
  Widget build(BuildContext context) {
    final coins = ref.watch(coinsList);
    return AlertDialog(
      insetPadding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      content: coins.when(
          data: (entries) {
            List<FlSpot> spots = [const FlSpot(0, 10000)];
            for (int i = 0; i < entries.length; i++) {
              spots.add(FlSpot((i + 1) * 1.0, entries[i]));
            }

            return AspectRatio(
              aspectRatio: 0.8,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: LineChart(LineChartData(
                  lineTouchData: const LineTouchData(enabled: false),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 30,
                            interval: 5000,
                            getTitlesWidget: (value, metaData) {
                              return Text(
                                value.toInt().toString(),
                                style: const TextStyle(fontSize: 8),
                              );
                            })),
                    bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 10,
                            interval: 50,
                            getTitlesWidget: (value, metaData) {
                              return Text(
                                value.toInt().toString(),
                                style: const TextStyle(fontSize: 8),
                              );
                            })),
                    rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                    topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                  ),
                  gridData: const FlGridData(show: false),
                  borderData: FlBorderData(
                    show: true,
                    border: Border(
                      bottom: BorderSide(
                          color: Colors.pink.withOpacity(0.2), width: 3),
                      left: const BorderSide(color: Colors.transparent),
                      right: const BorderSide(color: Colors.transparent),
                      top: const BorderSide(color: Colors.transparent),
                    ),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                        isCurved: true,
                        color: Colors.red,
                        barWidth: 1.5,
                        isStrokeCapRound: true,
                        dotData: const FlDotData(show: false),
                        belowBarData: BarAreaData(show: false),
                        spots: spots)
                  ],
                )),
              ),
            );
          },
          error: (e, s) {
            return const Text('!');
          },
          loading: () => const Center(child: CircularProgressIndicator())),
    );
  }
}
