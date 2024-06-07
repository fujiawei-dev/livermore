import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../logger.dart';
import 'home/state.dart';
import 'records_screen.dart';
import 'training_screen.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int _currentIndex = 0;
  List<Widget> _screens = [];

  @override
  void initState() {
    super.initState();

    _screens = [const TrainingScreen(), const RecordsScreen()];
  }

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final record = ref.watch(lastTrainingRecord);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Row(
          children: [
            const Text('模拟交易',
                style: TextStyle(color: Colors.white, fontSize: 20)),
            const Spacer(),
            Column(
              children: [
                const Text(
                  "贝壳数量",
                  textAlign: TextAlign.right,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                record.when(
                  data: (entry) {
                    currentCoins = entry?.coinsEnd ?? currentCoins;
                    return Text(
                      NumberFormat('#,###.##').format(currentCoins),
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    );
                  },
                  error: (e, s) {
                    logger.d(e.toString(), error: e, stackTrace: s);
                    return const Text('error');
                  },
                  loading: () => const Text(
                    'loading',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: _screens.elementAt(_currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: '训练',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: '记录',
          ),
        ],
      ),
    );
  }
}
