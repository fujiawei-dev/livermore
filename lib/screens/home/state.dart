import 'package:riverpod/riverpod.dart';

import '../../db/db.dart';

final lastTrainingRecord = StreamProvider((ref) {
  final database = ref.watch(AppDatabase.provider);

  return database.lastTrainingRecord();
});

final recentTrainingRecords = StreamProvider((ref) {
  final database = ref.watch(AppDatabase.provider);

  return database.recentTrainingRecords();
});

double currentCoins = 10000.0;
