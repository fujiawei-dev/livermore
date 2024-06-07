import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../db/db.dart';

final _dateFormat = DateFormat("yyyy.MM.dd");

class TradingResultCard extends StatelessWidget {
  final TrainingRecordsCompanion record;

  const TradingResultCard({super.key, required this.record});

  @override
  Widget build(BuildContext context) {
    var profit = record.coinsEnd.value - record.coinsBegin.value;
    var color = profit > 0 ? Colors.red : Colors.green;
    var increase = record.increase.value;

    return Card(
      margin: const EdgeInsets.all(0),
      child: Container(
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.22,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                const Text('训练标的：',
                    style: TextStyle(color: Colors.black, fontSize: 16)),
                const Spacer(),
                Text('${record.stock.value}(${record.code.value})',
                    textAlign: TextAlign.left,
                    style: const TextStyle(color: Colors.orange, fontSize: 16)),
              ],
            ),
            Row(
              children: [
                const Text('交易区间：',
                    style: TextStyle(color: Colors.black, fontSize: 16)),
                const Spacer(),
                Text(
                    '${_dateFormat.format(record.tradeBegin.value)}-'
                    '${_dateFormat.format(record.tradeEnd.value)}',
                    textAlign: TextAlign.left,
                    style: const TextStyle(color: Colors.blue, fontSize: 16)),
              ],
            ),
            Row(
              children: [
                const Text('本局盈亏：',
                    style: TextStyle(color: Colors.black, fontSize: 16)),
                const Spacer(),
                Text((profit).toStringAsFixed(2),
                    textAlign: TextAlign.left,
                    style: TextStyle(color: color, fontSize: 16)),
              ],
            ),
            Row(
              children: [
                const Text('本局收益：',
                    style: TextStyle(color: Colors.black, fontSize: 16)),
                const Spacer(),
                Text('${record.profit.value.toStringAsFixed(2)}%',
                    textAlign: TextAlign.left,
                    style: TextStyle(color: color, fontSize: 16)),
              ],
            ),
            Row(
              children: [
                const Text('区间涨幅：',
                    style: TextStyle(color: Colors.black, fontSize: 16)),
                const Spacer(),
                Text('${increase.toStringAsFixed(2)}%',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: increase > 0 ? Colors.red : Colors.green,
                        fontSize: 16)),
              ],
            ),
            Row(
              children: [
                const Text('开仓次数：',
                    style: TextStyle(color: Colors.black, fontSize: 16)),
                const Spacer(),
                Text('${record.open.value}',
                    textAlign: TextAlign.left,
                    style: const TextStyle(color: Colors.black, fontSize: 16)),
              ],
            ),
            Row(
              children: [
                const Text('开仓胜率：',
                    style: TextStyle(color: Colors.black, fontSize: 16)),
                const Spacer(),
                Text(
                    '${record.open.value > 0 ? record.rate.value.toStringAsFixed(2) : 100}%',
                    textAlign: TextAlign.left,
                    style: const TextStyle(color: Colors.black, fontSize: 16)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
