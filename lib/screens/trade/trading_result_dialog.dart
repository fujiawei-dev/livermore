import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../db/db.dart';
import 'trading_result_card.dart';

class TradingResultDialog extends StatelessWidget {
  final TrainingRecordsCompanion record;
  final VoidCallback? onPressed;

  const TradingResultDialog({super.key, required this.record, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.fromLTRB(15, 60, 15, 100),
      title: const Text('训练结果',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black, fontSize: 20)),
      content: TradingResultCard(record: record),
      actions: [
        TextButton(
          child: const Text('回到首页'),
          onPressed: () => context.go('/'),
        ),
        TextButton(
          onPressed: onPressed,
          child: const Text('下一局'),
        ),
      ],
    );
  }
}
