import 'package:flutter/material.dart';

import '../../api/api.dart';

const style = TextStyle(fontSize: 14);

class BaseInfoBanner extends StatelessWidget {
  const BaseInfoBanner({super.key, required this.kLine});

  final TrainKLine kLine;

  @override
  Widget build(BuildContext context) {
    var close = kLine.close.toStringAsFixed(2);
    var open = kLine.open.toStringAsFixed(2);
    var high = kLine.high.toStringAsFixed(2);
    var low = kLine.low.toStringAsFixed(2);
    var color = kLine.pct > 0 ? Colors.red : Colors.green;

    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('开：$open', textAlign: TextAlign.center, style: style),
            Text('收：$close', textAlign: TextAlign.center, style: style),
          ],
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('高：$high', textAlign: TextAlign.center, style: style),
            Text('低：$low', textAlign: TextAlign.center, style: style),
          ],
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('量：${kLine.vol.toInt()}',
                textAlign: TextAlign.center, style: style),
            Text('换：${kLine.turnoverRate}%',
                textAlign: TextAlign.center, style: style),
          ],
        ),
        const Spacer(),
        Column(
          children: [
            Text(close,
                textAlign: TextAlign.center,
                style: TextStyle(color: color, fontSize: 14)),
            Row(
              children: [
                Text(kLine.changes.toString(),
                    style: TextStyle(color: color, fontSize: 14)),
                const SizedBox(width: 10),
                Text('${kLine.pct}%',
                    style: TextStyle(color: color, fontSize: 18)),
              ],
            )
          ],
        ),
      ],
    );
  }
}
