import 'package:flutter/material.dart';

import '../../api/api.dart';

class BaseInfoBanner extends StatelessWidget {
  const BaseInfoBanner({super.key, required this.kLine});

  final TrainKLine kLine;

  @override
  Widget build(BuildContext context) {
    var close = kLine.close.toString();
    var open = kLine.open.toString();
    var high = kLine.high.toString();
    var low = kLine.low.toString();
    var color = kLine.pct > 0 ? Colors.red : Colors.green;

    return Row(
      children: [
        Column(
          children: [
            Text(close,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: color,
                  fontSize: 14,
                )),
            Row(
              children: [
                Text(kLine.changes.toString(),
                    style: TextStyle(color: color, fontSize: 14)),
                const SizedBox(width: 10),
                Text('${kLine.pct}%',
                    style: TextStyle(color: color, fontSize: 14)),
              ],
            )
          ],
        ),
        const Spacer(),
        Column(
          children: [
            Text('开：$open',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                )),
            Text('收：$close',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                )),
          ],
        ),
        const Spacer(),
        Column(
          children: [
            Text('高：$high',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                )),
            Text('低：$low',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                )),
          ],
        ),
        const Spacer(),
        Column(
          children: [
            Text('量：${kLine.vol.toInt()}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                )),
            Text('换：${kLine.turnoverRate}%',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                )),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
