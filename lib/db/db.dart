import 'dart:async';

import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'connection/connection.dart' as impl;
import 'tables.dart';

part 'db.g.dart';

@DriftDatabase(tables: [TrainingRecords])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(impl.connect());

  AppDatabase.forTesting(DatabaseConnection super.connection);

  @override
  int get schemaVersion => 3;

  Stream<TrainingRecord> trainingRecordById(int id) {
    return (select(trainingRecords)..where((tbl) => tbl.id.equals(id)))
        .watchSingle();
  }

  Stream<TrainingRecord?> lastTrainingRecord() {
    return (select(trainingRecords)
          ..orderBy([(t) => OrderingTerm.desc(t.id)])
          ..limit(1))
        .watchSingleOrNull();
  }

  // 最新训练记录
  Stream<List<TrainingRecord>> recentTrainingRecords() {
    return (select(trainingRecords)
          ..orderBy([(t) => OrderingTerm.desc(t.id)])
          ..limit(20))
        .watch();
  }

  static final StateProvider<AppDatabase> provider = StateProvider((ref) {
    final database = AppDatabase();
    ref.onDispose(database.close);

    return database;
  });
}
