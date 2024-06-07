import 'package:flutter/material.dart';

class TradingResultsBanner extends StatelessWidget {
  const TradingResultsBanner({
    super.key,
    required double coinsEnd,
    required double coinsBegin,
    required double coinsLast,
  })  : _coinsEnd = coinsEnd,
        _coinsBegin = coinsBegin,
        _coinsLast = coinsLast;

  final double _coinsEnd;
  final double _coinsBegin;
  final double _coinsLast;

  @override
  Widget build(BuildContext context) {
    var r1 = (_coinsEnd - _coinsBegin) / _coinsBegin * 100;
    var r2 = (_coinsEnd - _coinsLast) / _coinsLast * 100;

    return Row(
      children: [
        Column(children: [
          const Text('贝壳数量',
              style: TextStyle(color: Colors.white, fontSize: 15)),
          Text(_coinsEnd.toStringAsFixed(2),
              style: const TextStyle(color: Colors.white, fontSize: 18)),
        ]),
        const Spacer(),
        Column(children: [
          const Text('本场收益',
              style: TextStyle(color: Colors.white, fontSize: 15)),
          Text('${r1.toStringAsFixed(2)}%',
              style: TextStyle(
                  color: (r1 > 0 ? Colors.red : Colors.green), fontSize: 18)),
        ]),
        const Spacer(),
        Column(children: [
          const Text('开仓收益',
              style: TextStyle(color: Colors.white, fontSize: 15)),
          Text('${r2.toStringAsFixed(2)}%',
              style: TextStyle(
                  color: (r2 > 0 ? Colors.red : Colors.green), fontSize: 18)),
        ]),
      ],
    );
  }
}
