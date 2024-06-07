import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../db/db.dart';

final _dateFormat = DateFormat("yyyy.MM.dd");

class RecentTrainingCard extends StatelessWidget {
  final TrainingRecord record;

  const RecentTrainingCard({super.key, required this.record});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Column(
          children: [
            Row(
              children: [
                const TrainingTypeTag(),
                const SizedBox(width: 5),
                Text(
                  record.stock,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(width: 5),
                Text(
                  record.code,
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
                const SizedBox(width: 10),
                Text(
                  '${_dateFormat.format(record.tradeBegin)}-'
                  '${_dateFormat.format(record.tradeEnd)}',
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Column(
                  children: [
                    Text(
                        DateFormat('yyyy-MM-dd HH:mm:ss')
                            .format(record.trainBegin),
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey)),
                    const Text('训练时间', style: TextStyle(fontSize: 12)),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    Text('${record.rate.toInt()}%',
                        style: const TextStyle(fontSize: 16)),
                    const Text('开仓胜率', style: TextStyle(fontSize: 12)),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    Text("${record.increase.toStringAsFixed(2)}%",
                        style: TextStyle(
                            fontSize: 16,
                            color: record.increase > 0
                                ? Colors.red
                                : Colors.green)),
                    const Text('区间涨幅', style: TextStyle(fontSize: 12)),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    Text(
                      '${record.profit.toStringAsFixed(2)}%',
                      style: TextStyle(
                          fontSize: 16,
                          color: record.profit > 0 ? Colors.red : Colors.green),
                    ),
                    const Text(
                      '模拟盈亏',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TrainingTypeTag extends StatelessWidget {
  const TrainingTypeTag({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 3, 5, 3),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        color: Theme.of(context).colorScheme.primary,
      ),
      child: const Text(
        '双盲训练',
        style: TextStyle(
          fontSize: 12,
          height: 1.0, // 解决顶部空白
          color: Colors.white,
        ),
      ),
    );
  }
}
