import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StartTrainingDialog extends StatelessWidget {
  const StartTrainingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('双盲训练',
          style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
      content: const Text('您即将开始双盲训练，'
          '此训练会提供未知时间未知股票半'
          '年的实盘日K线，并要求您在此后'
          '90根K线里模拟交易，盈亏将直接'
          '影响到您的金币数量，请认真对待。'),
      actions: [
        TextButton(
          child: const Text('取消'),
          onPressed: () => Navigator.pop(context),
        ),
        TextButton(
          child: const Text('确认'),
          onPressed: () {
            Navigator.pop(context);
            // context.go('/loading');
            context.go('/trading');
          },
        ),
      ],
    );
  }
}
