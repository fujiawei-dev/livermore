import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'home/coins_line_chart.dart';
import 'home/state.dart';
import 'training.dart';

const TextStyle titleStyle = TextStyle(color: Colors.white, fontSize: 14);

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final record = ref.watch(lastTrainingRecord);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => {
                    showDialog(
                        context: context,
                        builder: (context) => const CoinsLineChart())
                  },
              icon: const Icon(
                Icons.history,
                color: Colors.white,
              ))
        ],
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Row(
          children: [
            Text('模拟交易', style: titleStyle.copyWith(fontSize: 20)),
            const Spacer(),
            Column(
              children: [
                const Text("贝壳数量", style: titleStyle),
                record.when(
                  data: (entry) {
                    currentCoins = entry?.coinsEnd ?? currentCoins;
                    return Text(
                      NumberFormat('#,###.##').format(currentCoins),
                      style: titleStyle.copyWith(fontSize: 18),
                    );
                  },
                  error: (e, s) => const Text('0', style: titleStyle),
                  loading: () => const Text('10000', style: titleStyle),
                )
              ],
            ),
          ],
        ),
      ),
      body: const TrainingScreen(),
    );
  }
}
