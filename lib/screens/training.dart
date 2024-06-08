import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'home/state.dart';
import 'training/recent_training_card.dart';

class TrainingScreen extends ConsumerStatefulWidget {
  const TrainingScreen({super.key});

  @override
  ConsumerState<TrainingScreen> createState() => _TrainingScreenState();
}

class _TrainingScreenState extends ConsumerState<TrainingScreen> {
  @override
  Widget build(BuildContext context) {
    final record = ref.watch(lastTrainingRecord);
    final records = ref.watch(recentTrainingRecords);

    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.all(18.0),
            child: OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.fromLTRB(28, 18, 28, 18),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  side: BorderSide.none),
              onPressed: () => context.go('/trading'),
              label: const Text('双盲训练', style: TextStyle(fontSize: 28)),
              icon: const Icon(Icons.candlestick_chart, size: 28),
              iconAlignment: IconAlignment.start,
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            record.when(
                data: (entry) => Text('训练场次 ${entry?.id ?? 0}'),
                error: (e, s) => const Text('!'),
                loading: () => const Text('?')),
            const Text('⬇最近训练如下⬇'),
          ],
        ),
        Expanded(
            child: records.when(
          data: (entries) {
            return ListView.builder(
              itemCount: entries.length,
              itemBuilder: (context, index) =>
                  RecentTrainingCard(record: entries[index]),
            );
          },
          error: (e, s) => const Text('!'),
          loading: () => const Center(child: CircularProgressIndicator()),
        ))
      ],
    );
  }
}
