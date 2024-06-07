import 'package:drift/drift.dart';

class TrainingRecords extends Table with AutoIncrementingPrimaryKey {
  DateTimeColumn get trainBegin => dateTime()(); // 训练开始时间
  DateTimeColumn get trainEnd => dateTime()(); // 训练结束时间

  RealColumn get coinsBegin => real()(); // 开始贝壳数量
  RealColumn get coinsEnd => real()(); // 结束贝壳数量
  RealColumn get profit => real()(); // 收益率百分比

  IntColumn get open => integer()(); // 开仓次数
  IntColumn get prof => integer()(); // 盈利次数
  IntColumn get loss => integer()(); // 亏损次数
  RealColumn get rate => real()(); // 开仓胜率百分比

  IntColumn get totalDays => integer()(); // 可交易天数
  IntColumn get days => integer()(); // 持仓天数
  RealColumn get holdRate => real()(); // 持仓率百分比

  BlobColumn get buys => blob()(); // 买点列表
  BlobColumn get sells => blob()(); // 卖点列表

  TextColumn get stock => text()(); // 名称
  TextColumn get code => text()(); // 代码
  DateTimeColumn get tradeBegin => dateTime()(); // 交易开始时间
  DateTimeColumn get tradeEnd => dateTime()(); // 交易结束时间
  BlobColumn get klines => blob()(); // 数据列表
  RealColumn get increase => real()(); // 区间涨幅百分比

  DateTimeColumn get createdAt => dateTime().nullable()();
}

// Tables can mix-in common definitions if needed
mixin AutoIncrementingPrimaryKey on Table {
  IntColumn get id => integer().autoIncrement()();
}
