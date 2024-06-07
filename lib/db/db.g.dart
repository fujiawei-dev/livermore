// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// ignore_for_file: type=lint
class $TrainingRecordsTable extends TrainingRecords
    with TableInfo<$TrainingRecordsTable, TrainingRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TrainingRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _trainBeginMeta =
      const VerificationMeta('trainBegin');
  @override
  late final GeneratedColumn<DateTime> trainBegin = GeneratedColumn<DateTime>(
      'train_begin', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _trainEndMeta =
      const VerificationMeta('trainEnd');
  @override
  late final GeneratedColumn<DateTime> trainEnd = GeneratedColumn<DateTime>(
      'train_end', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _coinsBeginMeta =
      const VerificationMeta('coinsBegin');
  @override
  late final GeneratedColumn<double> coinsBegin = GeneratedColumn<double>(
      'coins_begin', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _coinsEndMeta =
      const VerificationMeta('coinsEnd');
  @override
  late final GeneratedColumn<double> coinsEnd = GeneratedColumn<double>(
      'coins_end', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _profitMeta = const VerificationMeta('profit');
  @override
  late final GeneratedColumn<double> profit = GeneratedColumn<double>(
      'profit', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _openMeta = const VerificationMeta('open');
  @override
  late final GeneratedColumn<int> open = GeneratedColumn<int>(
      'open', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _profMeta = const VerificationMeta('prof');
  @override
  late final GeneratedColumn<int> prof = GeneratedColumn<int>(
      'prof', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _lossMeta = const VerificationMeta('loss');
  @override
  late final GeneratedColumn<int> loss = GeneratedColumn<int>(
      'loss', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _rateMeta = const VerificationMeta('rate');
  @override
  late final GeneratedColumn<double> rate = GeneratedColumn<double>(
      'rate', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _totalDaysMeta =
      const VerificationMeta('totalDays');
  @override
  late final GeneratedColumn<int> totalDays = GeneratedColumn<int>(
      'total_days', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _daysMeta = const VerificationMeta('days');
  @override
  late final GeneratedColumn<int> days = GeneratedColumn<int>(
      'days', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _holdRateMeta =
      const VerificationMeta('holdRate');
  @override
  late final GeneratedColumn<double> holdRate = GeneratedColumn<double>(
      'hold_rate', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _buysMeta = const VerificationMeta('buys');
  @override
  late final GeneratedColumn<Uint8List> buys = GeneratedColumn<Uint8List>(
      'buys', aliasedName, false,
      type: DriftSqlType.blob, requiredDuringInsert: true);
  static const VerificationMeta _sellsMeta = const VerificationMeta('sells');
  @override
  late final GeneratedColumn<Uint8List> sells = GeneratedColumn<Uint8List>(
      'sells', aliasedName, false,
      type: DriftSqlType.blob, requiredDuringInsert: true);
  static const VerificationMeta _stockMeta = const VerificationMeta('stock');
  @override
  late final GeneratedColumn<String> stock = GeneratedColumn<String>(
      'stock', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tradeBeginMeta =
      const VerificationMeta('tradeBegin');
  @override
  late final GeneratedColumn<DateTime> tradeBegin = GeneratedColumn<DateTime>(
      'trade_begin', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _tradeEndMeta =
      const VerificationMeta('tradeEnd');
  @override
  late final GeneratedColumn<DateTime> tradeEnd = GeneratedColumn<DateTime>(
      'trade_end', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _klinesMeta = const VerificationMeta('klines');
  @override
  late final GeneratedColumn<Uint8List> klines = GeneratedColumn<Uint8List>(
      'klines', aliasedName, false,
      type: DriftSqlType.blob, requiredDuringInsert: true);
  static const VerificationMeta _increaseMeta =
      const VerificationMeta('increase');
  @override
  late final GeneratedColumn<double> increase = GeneratedColumn<double>(
      'increase', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        trainBegin,
        trainEnd,
        coinsBegin,
        coinsEnd,
        profit,
        open,
        prof,
        loss,
        rate,
        totalDays,
        days,
        holdRate,
        buys,
        sells,
        stock,
        code,
        tradeBegin,
        tradeEnd,
        klines,
        increase,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'training_records';
  @override
  VerificationContext validateIntegrity(Insertable<TrainingRecord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('train_begin')) {
      context.handle(
          _trainBeginMeta,
          trainBegin.isAcceptableOrUnknown(
              data['train_begin']!, _trainBeginMeta));
    } else if (isInserting) {
      context.missing(_trainBeginMeta);
    }
    if (data.containsKey('train_end')) {
      context.handle(_trainEndMeta,
          trainEnd.isAcceptableOrUnknown(data['train_end']!, _trainEndMeta));
    } else if (isInserting) {
      context.missing(_trainEndMeta);
    }
    if (data.containsKey('coins_begin')) {
      context.handle(
          _coinsBeginMeta,
          coinsBegin.isAcceptableOrUnknown(
              data['coins_begin']!, _coinsBeginMeta));
    } else if (isInserting) {
      context.missing(_coinsBeginMeta);
    }
    if (data.containsKey('coins_end')) {
      context.handle(_coinsEndMeta,
          coinsEnd.isAcceptableOrUnknown(data['coins_end']!, _coinsEndMeta));
    } else if (isInserting) {
      context.missing(_coinsEndMeta);
    }
    if (data.containsKey('profit')) {
      context.handle(_profitMeta,
          profit.isAcceptableOrUnknown(data['profit']!, _profitMeta));
    } else if (isInserting) {
      context.missing(_profitMeta);
    }
    if (data.containsKey('open')) {
      context.handle(
          _openMeta, open.isAcceptableOrUnknown(data['open']!, _openMeta));
    } else if (isInserting) {
      context.missing(_openMeta);
    }
    if (data.containsKey('prof')) {
      context.handle(
          _profMeta, prof.isAcceptableOrUnknown(data['prof']!, _profMeta));
    } else if (isInserting) {
      context.missing(_profMeta);
    }
    if (data.containsKey('loss')) {
      context.handle(
          _lossMeta, loss.isAcceptableOrUnknown(data['loss']!, _lossMeta));
    } else if (isInserting) {
      context.missing(_lossMeta);
    }
    if (data.containsKey('rate')) {
      context.handle(
          _rateMeta, rate.isAcceptableOrUnknown(data['rate']!, _rateMeta));
    } else if (isInserting) {
      context.missing(_rateMeta);
    }
    if (data.containsKey('total_days')) {
      context.handle(_totalDaysMeta,
          totalDays.isAcceptableOrUnknown(data['total_days']!, _totalDaysMeta));
    } else if (isInserting) {
      context.missing(_totalDaysMeta);
    }
    if (data.containsKey('days')) {
      context.handle(
          _daysMeta, days.isAcceptableOrUnknown(data['days']!, _daysMeta));
    } else if (isInserting) {
      context.missing(_daysMeta);
    }
    if (data.containsKey('hold_rate')) {
      context.handle(_holdRateMeta,
          holdRate.isAcceptableOrUnknown(data['hold_rate']!, _holdRateMeta));
    } else if (isInserting) {
      context.missing(_holdRateMeta);
    }
    if (data.containsKey('buys')) {
      context.handle(
          _buysMeta, buys.isAcceptableOrUnknown(data['buys']!, _buysMeta));
    } else if (isInserting) {
      context.missing(_buysMeta);
    }
    if (data.containsKey('sells')) {
      context.handle(
          _sellsMeta, sells.isAcceptableOrUnknown(data['sells']!, _sellsMeta));
    } else if (isInserting) {
      context.missing(_sellsMeta);
    }
    if (data.containsKey('stock')) {
      context.handle(
          _stockMeta, stock.isAcceptableOrUnknown(data['stock']!, _stockMeta));
    } else if (isInserting) {
      context.missing(_stockMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code']!, _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('trade_begin')) {
      context.handle(
          _tradeBeginMeta,
          tradeBegin.isAcceptableOrUnknown(
              data['trade_begin']!, _tradeBeginMeta));
    } else if (isInserting) {
      context.missing(_tradeBeginMeta);
    }
    if (data.containsKey('trade_end')) {
      context.handle(_tradeEndMeta,
          tradeEnd.isAcceptableOrUnknown(data['trade_end']!, _tradeEndMeta));
    } else if (isInserting) {
      context.missing(_tradeEndMeta);
    }
    if (data.containsKey('klines')) {
      context.handle(_klinesMeta,
          klines.isAcceptableOrUnknown(data['klines']!, _klinesMeta));
    } else if (isInserting) {
      context.missing(_klinesMeta);
    }
    if (data.containsKey('increase')) {
      context.handle(_increaseMeta,
          increase.isAcceptableOrUnknown(data['increase']!, _increaseMeta));
    } else if (isInserting) {
      context.missing(_increaseMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TrainingRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TrainingRecord(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      trainBegin: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}train_begin'])!,
      trainEnd: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}train_end'])!,
      coinsBegin: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}coins_begin'])!,
      coinsEnd: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}coins_end'])!,
      profit: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}profit'])!,
      open: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}open'])!,
      prof: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}prof'])!,
      loss: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}loss'])!,
      rate: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}rate'])!,
      totalDays: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}total_days'])!,
      days: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}days'])!,
      holdRate: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}hold_rate'])!,
      buys: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}buys'])!,
      sells: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}sells'])!,
      stock: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}stock'])!,
      code: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}code'])!,
      tradeBegin: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}trade_begin'])!,
      tradeEnd: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}trade_end'])!,
      klines: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}klines'])!,
      increase: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}increase'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at']),
    );
  }

  @override
  $TrainingRecordsTable createAlias(String alias) {
    return $TrainingRecordsTable(attachedDatabase, alias);
  }
}

class TrainingRecord extends DataClass implements Insertable<TrainingRecord> {
  final int id;
  final DateTime trainBegin;
  final DateTime trainEnd;
  final double coinsBegin;
  final double coinsEnd;
  final double profit;
  final int open;
  final int prof;
  final int loss;
  final double rate;
  final int totalDays;
  final int days;
  final double holdRate;
  final Uint8List buys;
  final Uint8List sells;
  final String stock;
  final String code;
  final DateTime tradeBegin;
  final DateTime tradeEnd;
  final Uint8List klines;
  final double increase;
  final DateTime? createdAt;
  const TrainingRecord(
      {required this.id,
      required this.trainBegin,
      required this.trainEnd,
      required this.coinsBegin,
      required this.coinsEnd,
      required this.profit,
      required this.open,
      required this.prof,
      required this.loss,
      required this.rate,
      required this.totalDays,
      required this.days,
      required this.holdRate,
      required this.buys,
      required this.sells,
      required this.stock,
      required this.code,
      required this.tradeBegin,
      required this.tradeEnd,
      required this.klines,
      required this.increase,
      this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['train_begin'] = Variable<DateTime>(trainBegin);
    map['train_end'] = Variable<DateTime>(trainEnd);
    map['coins_begin'] = Variable<double>(coinsBegin);
    map['coins_end'] = Variable<double>(coinsEnd);
    map['profit'] = Variable<double>(profit);
    map['open'] = Variable<int>(open);
    map['prof'] = Variable<int>(prof);
    map['loss'] = Variable<int>(loss);
    map['rate'] = Variable<double>(rate);
    map['total_days'] = Variable<int>(totalDays);
    map['days'] = Variable<int>(days);
    map['hold_rate'] = Variable<double>(holdRate);
    map['buys'] = Variable<Uint8List>(buys);
    map['sells'] = Variable<Uint8List>(sells);
    map['stock'] = Variable<String>(stock);
    map['code'] = Variable<String>(code);
    map['trade_begin'] = Variable<DateTime>(tradeBegin);
    map['trade_end'] = Variable<DateTime>(tradeEnd);
    map['klines'] = Variable<Uint8List>(klines);
    map['increase'] = Variable<double>(increase);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    return map;
  }

  TrainingRecordsCompanion toCompanion(bool nullToAbsent) {
    return TrainingRecordsCompanion(
      id: Value(id),
      trainBegin: Value(trainBegin),
      trainEnd: Value(trainEnd),
      coinsBegin: Value(coinsBegin),
      coinsEnd: Value(coinsEnd),
      profit: Value(profit),
      open: Value(open),
      prof: Value(prof),
      loss: Value(loss),
      rate: Value(rate),
      totalDays: Value(totalDays),
      days: Value(days),
      holdRate: Value(holdRate),
      buys: Value(buys),
      sells: Value(sells),
      stock: Value(stock),
      code: Value(code),
      tradeBegin: Value(tradeBegin),
      tradeEnd: Value(tradeEnd),
      klines: Value(klines),
      increase: Value(increase),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
    );
  }

  factory TrainingRecord.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TrainingRecord(
      id: serializer.fromJson<int>(json['id']),
      trainBegin: serializer.fromJson<DateTime>(json['trainBegin']),
      trainEnd: serializer.fromJson<DateTime>(json['trainEnd']),
      coinsBegin: serializer.fromJson<double>(json['coinsBegin']),
      coinsEnd: serializer.fromJson<double>(json['coinsEnd']),
      profit: serializer.fromJson<double>(json['profit']),
      open: serializer.fromJson<int>(json['open']),
      prof: serializer.fromJson<int>(json['prof']),
      loss: serializer.fromJson<int>(json['loss']),
      rate: serializer.fromJson<double>(json['rate']),
      totalDays: serializer.fromJson<int>(json['totalDays']),
      days: serializer.fromJson<int>(json['days']),
      holdRate: serializer.fromJson<double>(json['holdRate']),
      buys: serializer.fromJson<Uint8List>(json['buys']),
      sells: serializer.fromJson<Uint8List>(json['sells']),
      stock: serializer.fromJson<String>(json['stock']),
      code: serializer.fromJson<String>(json['code']),
      tradeBegin: serializer.fromJson<DateTime>(json['tradeBegin']),
      tradeEnd: serializer.fromJson<DateTime>(json['tradeEnd']),
      klines: serializer.fromJson<Uint8List>(json['klines']),
      increase: serializer.fromJson<double>(json['increase']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'trainBegin': serializer.toJson<DateTime>(trainBegin),
      'trainEnd': serializer.toJson<DateTime>(trainEnd),
      'coinsBegin': serializer.toJson<double>(coinsBegin),
      'coinsEnd': serializer.toJson<double>(coinsEnd),
      'profit': serializer.toJson<double>(profit),
      'open': serializer.toJson<int>(open),
      'prof': serializer.toJson<int>(prof),
      'loss': serializer.toJson<int>(loss),
      'rate': serializer.toJson<double>(rate),
      'totalDays': serializer.toJson<int>(totalDays),
      'days': serializer.toJson<int>(days),
      'holdRate': serializer.toJson<double>(holdRate),
      'buys': serializer.toJson<Uint8List>(buys),
      'sells': serializer.toJson<Uint8List>(sells),
      'stock': serializer.toJson<String>(stock),
      'code': serializer.toJson<String>(code),
      'tradeBegin': serializer.toJson<DateTime>(tradeBegin),
      'tradeEnd': serializer.toJson<DateTime>(tradeEnd),
      'klines': serializer.toJson<Uint8List>(klines),
      'increase': serializer.toJson<double>(increase),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
    };
  }

  TrainingRecord copyWith(
          {int? id,
          DateTime? trainBegin,
          DateTime? trainEnd,
          double? coinsBegin,
          double? coinsEnd,
          double? profit,
          int? open,
          int? prof,
          int? loss,
          double? rate,
          int? totalDays,
          int? days,
          double? holdRate,
          Uint8List? buys,
          Uint8List? sells,
          String? stock,
          String? code,
          DateTime? tradeBegin,
          DateTime? tradeEnd,
          Uint8List? klines,
          double? increase,
          Value<DateTime?> createdAt = const Value.absent()}) =>
      TrainingRecord(
        id: id ?? this.id,
        trainBegin: trainBegin ?? this.trainBegin,
        trainEnd: trainEnd ?? this.trainEnd,
        coinsBegin: coinsBegin ?? this.coinsBegin,
        coinsEnd: coinsEnd ?? this.coinsEnd,
        profit: profit ?? this.profit,
        open: open ?? this.open,
        prof: prof ?? this.prof,
        loss: loss ?? this.loss,
        rate: rate ?? this.rate,
        totalDays: totalDays ?? this.totalDays,
        days: days ?? this.days,
        holdRate: holdRate ?? this.holdRate,
        buys: buys ?? this.buys,
        sells: sells ?? this.sells,
        stock: stock ?? this.stock,
        code: code ?? this.code,
        tradeBegin: tradeBegin ?? this.tradeBegin,
        tradeEnd: tradeEnd ?? this.tradeEnd,
        klines: klines ?? this.klines,
        increase: increase ?? this.increase,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('TrainingRecord(')
          ..write('id: $id, ')
          ..write('trainBegin: $trainBegin, ')
          ..write('trainEnd: $trainEnd, ')
          ..write('coinsBegin: $coinsBegin, ')
          ..write('coinsEnd: $coinsEnd, ')
          ..write('profit: $profit, ')
          ..write('open: $open, ')
          ..write('prof: $prof, ')
          ..write('loss: $loss, ')
          ..write('rate: $rate, ')
          ..write('totalDays: $totalDays, ')
          ..write('days: $days, ')
          ..write('holdRate: $holdRate, ')
          ..write('buys: $buys, ')
          ..write('sells: $sells, ')
          ..write('stock: $stock, ')
          ..write('code: $code, ')
          ..write('tradeBegin: $tradeBegin, ')
          ..write('tradeEnd: $tradeEnd, ')
          ..write('klines: $klines, ')
          ..write('increase: $increase, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        trainBegin,
        trainEnd,
        coinsBegin,
        coinsEnd,
        profit,
        open,
        prof,
        loss,
        rate,
        totalDays,
        days,
        holdRate,
        $driftBlobEquality.hash(buys),
        $driftBlobEquality.hash(sells),
        stock,
        code,
        tradeBegin,
        tradeEnd,
        $driftBlobEquality.hash(klines),
        increase,
        createdAt
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TrainingRecord &&
          other.id == this.id &&
          other.trainBegin == this.trainBegin &&
          other.trainEnd == this.trainEnd &&
          other.coinsBegin == this.coinsBegin &&
          other.coinsEnd == this.coinsEnd &&
          other.profit == this.profit &&
          other.open == this.open &&
          other.prof == this.prof &&
          other.loss == this.loss &&
          other.rate == this.rate &&
          other.totalDays == this.totalDays &&
          other.days == this.days &&
          other.holdRate == this.holdRate &&
          $driftBlobEquality.equals(other.buys, this.buys) &&
          $driftBlobEquality.equals(other.sells, this.sells) &&
          other.stock == this.stock &&
          other.code == this.code &&
          other.tradeBegin == this.tradeBegin &&
          other.tradeEnd == this.tradeEnd &&
          $driftBlobEquality.equals(other.klines, this.klines) &&
          other.increase == this.increase &&
          other.createdAt == this.createdAt);
}

class TrainingRecordsCompanion extends UpdateCompanion<TrainingRecord> {
  final Value<int> id;
  final Value<DateTime> trainBegin;
  final Value<DateTime> trainEnd;
  final Value<double> coinsBegin;
  final Value<double> coinsEnd;
  final Value<double> profit;
  final Value<int> open;
  final Value<int> prof;
  final Value<int> loss;
  final Value<double> rate;
  final Value<int> totalDays;
  final Value<int> days;
  final Value<double> holdRate;
  final Value<Uint8List> buys;
  final Value<Uint8List> sells;
  final Value<String> stock;
  final Value<String> code;
  final Value<DateTime> tradeBegin;
  final Value<DateTime> tradeEnd;
  final Value<Uint8List> klines;
  final Value<double> increase;
  final Value<DateTime?> createdAt;
  const TrainingRecordsCompanion({
    this.id = const Value.absent(),
    this.trainBegin = const Value.absent(),
    this.trainEnd = const Value.absent(),
    this.coinsBegin = const Value.absent(),
    this.coinsEnd = const Value.absent(),
    this.profit = const Value.absent(),
    this.open = const Value.absent(),
    this.prof = const Value.absent(),
    this.loss = const Value.absent(),
    this.rate = const Value.absent(),
    this.totalDays = const Value.absent(),
    this.days = const Value.absent(),
    this.holdRate = const Value.absent(),
    this.buys = const Value.absent(),
    this.sells = const Value.absent(),
    this.stock = const Value.absent(),
    this.code = const Value.absent(),
    this.tradeBegin = const Value.absent(),
    this.tradeEnd = const Value.absent(),
    this.klines = const Value.absent(),
    this.increase = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  TrainingRecordsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime trainBegin,
    required DateTime trainEnd,
    required double coinsBegin,
    required double coinsEnd,
    required double profit,
    required int open,
    required int prof,
    required int loss,
    required double rate,
    required int totalDays,
    required int days,
    required double holdRate,
    required Uint8List buys,
    required Uint8List sells,
    required String stock,
    required String code,
    required DateTime tradeBegin,
    required DateTime tradeEnd,
    required Uint8List klines,
    required double increase,
    this.createdAt = const Value.absent(),
  })  : trainBegin = Value(trainBegin),
        trainEnd = Value(trainEnd),
        coinsBegin = Value(coinsBegin),
        coinsEnd = Value(coinsEnd),
        profit = Value(profit),
        open = Value(open),
        prof = Value(prof),
        loss = Value(loss),
        rate = Value(rate),
        totalDays = Value(totalDays),
        days = Value(days),
        holdRate = Value(holdRate),
        buys = Value(buys),
        sells = Value(sells),
        stock = Value(stock),
        code = Value(code),
        tradeBegin = Value(tradeBegin),
        tradeEnd = Value(tradeEnd),
        klines = Value(klines),
        increase = Value(increase);
  static Insertable<TrainingRecord> custom({
    Expression<int>? id,
    Expression<DateTime>? trainBegin,
    Expression<DateTime>? trainEnd,
    Expression<double>? coinsBegin,
    Expression<double>? coinsEnd,
    Expression<double>? profit,
    Expression<int>? open,
    Expression<int>? prof,
    Expression<int>? loss,
    Expression<double>? rate,
    Expression<int>? totalDays,
    Expression<int>? days,
    Expression<double>? holdRate,
    Expression<Uint8List>? buys,
    Expression<Uint8List>? sells,
    Expression<String>? stock,
    Expression<String>? code,
    Expression<DateTime>? tradeBegin,
    Expression<DateTime>? tradeEnd,
    Expression<Uint8List>? klines,
    Expression<double>? increase,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (trainBegin != null) 'train_begin': trainBegin,
      if (trainEnd != null) 'train_end': trainEnd,
      if (coinsBegin != null) 'coins_begin': coinsBegin,
      if (coinsEnd != null) 'coins_end': coinsEnd,
      if (profit != null) 'profit': profit,
      if (open != null) 'open': open,
      if (prof != null) 'prof': prof,
      if (loss != null) 'loss': loss,
      if (rate != null) 'rate': rate,
      if (totalDays != null) 'total_days': totalDays,
      if (days != null) 'days': days,
      if (holdRate != null) 'hold_rate': holdRate,
      if (buys != null) 'buys': buys,
      if (sells != null) 'sells': sells,
      if (stock != null) 'stock': stock,
      if (code != null) 'code': code,
      if (tradeBegin != null) 'trade_begin': tradeBegin,
      if (tradeEnd != null) 'trade_end': tradeEnd,
      if (klines != null) 'klines': klines,
      if (increase != null) 'increase': increase,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  TrainingRecordsCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? trainBegin,
      Value<DateTime>? trainEnd,
      Value<double>? coinsBegin,
      Value<double>? coinsEnd,
      Value<double>? profit,
      Value<int>? open,
      Value<int>? prof,
      Value<int>? loss,
      Value<double>? rate,
      Value<int>? totalDays,
      Value<int>? days,
      Value<double>? holdRate,
      Value<Uint8List>? buys,
      Value<Uint8List>? sells,
      Value<String>? stock,
      Value<String>? code,
      Value<DateTime>? tradeBegin,
      Value<DateTime>? tradeEnd,
      Value<Uint8List>? klines,
      Value<double>? increase,
      Value<DateTime?>? createdAt}) {
    return TrainingRecordsCompanion(
      id: id ?? this.id,
      trainBegin: trainBegin ?? this.trainBegin,
      trainEnd: trainEnd ?? this.trainEnd,
      coinsBegin: coinsBegin ?? this.coinsBegin,
      coinsEnd: coinsEnd ?? this.coinsEnd,
      profit: profit ?? this.profit,
      open: open ?? this.open,
      prof: prof ?? this.prof,
      loss: loss ?? this.loss,
      rate: rate ?? this.rate,
      totalDays: totalDays ?? this.totalDays,
      days: days ?? this.days,
      holdRate: holdRate ?? this.holdRate,
      buys: buys ?? this.buys,
      sells: sells ?? this.sells,
      stock: stock ?? this.stock,
      code: code ?? this.code,
      tradeBegin: tradeBegin ?? this.tradeBegin,
      tradeEnd: tradeEnd ?? this.tradeEnd,
      klines: klines ?? this.klines,
      increase: increase ?? this.increase,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (trainBegin.present) {
      map['train_begin'] = Variable<DateTime>(trainBegin.value);
    }
    if (trainEnd.present) {
      map['train_end'] = Variable<DateTime>(trainEnd.value);
    }
    if (coinsBegin.present) {
      map['coins_begin'] = Variable<double>(coinsBegin.value);
    }
    if (coinsEnd.present) {
      map['coins_end'] = Variable<double>(coinsEnd.value);
    }
    if (profit.present) {
      map['profit'] = Variable<double>(profit.value);
    }
    if (open.present) {
      map['open'] = Variable<int>(open.value);
    }
    if (prof.present) {
      map['prof'] = Variable<int>(prof.value);
    }
    if (loss.present) {
      map['loss'] = Variable<int>(loss.value);
    }
    if (rate.present) {
      map['rate'] = Variable<double>(rate.value);
    }
    if (totalDays.present) {
      map['total_days'] = Variable<int>(totalDays.value);
    }
    if (days.present) {
      map['days'] = Variable<int>(days.value);
    }
    if (holdRate.present) {
      map['hold_rate'] = Variable<double>(holdRate.value);
    }
    if (buys.present) {
      map['buys'] = Variable<Uint8List>(buys.value);
    }
    if (sells.present) {
      map['sells'] = Variable<Uint8List>(sells.value);
    }
    if (stock.present) {
      map['stock'] = Variable<String>(stock.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (tradeBegin.present) {
      map['trade_begin'] = Variable<DateTime>(tradeBegin.value);
    }
    if (tradeEnd.present) {
      map['trade_end'] = Variable<DateTime>(tradeEnd.value);
    }
    if (klines.present) {
      map['klines'] = Variable<Uint8List>(klines.value);
    }
    if (increase.present) {
      map['increase'] = Variable<double>(increase.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TrainingRecordsCompanion(')
          ..write('id: $id, ')
          ..write('trainBegin: $trainBegin, ')
          ..write('trainEnd: $trainEnd, ')
          ..write('coinsBegin: $coinsBegin, ')
          ..write('coinsEnd: $coinsEnd, ')
          ..write('profit: $profit, ')
          ..write('open: $open, ')
          ..write('prof: $prof, ')
          ..write('loss: $loss, ')
          ..write('rate: $rate, ')
          ..write('totalDays: $totalDays, ')
          ..write('days: $days, ')
          ..write('holdRate: $holdRate, ')
          ..write('buys: $buys, ')
          ..write('sells: $sells, ')
          ..write('stock: $stock, ')
          ..write('code: $code, ')
          ..write('tradeBegin: $tradeBegin, ')
          ..write('tradeEnd: $tradeEnd, ')
          ..write('klines: $klines, ')
          ..write('increase: $increase, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  _$AppDatabaseManager get managers => _$AppDatabaseManager(this);
  late final $TrainingRecordsTable trainingRecords =
      $TrainingRecordsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [trainingRecords];
}

typedef $$TrainingRecordsTableInsertCompanionBuilder = TrainingRecordsCompanion
    Function({
  Value<int> id,
  required DateTime trainBegin,
  required DateTime trainEnd,
  required double coinsBegin,
  required double coinsEnd,
  required double profit,
  required int open,
  required int prof,
  required int loss,
  required double rate,
  required int totalDays,
  required int days,
  required double holdRate,
  required Uint8List buys,
  required Uint8List sells,
  required String stock,
  required String code,
  required DateTime tradeBegin,
  required DateTime tradeEnd,
  required Uint8List klines,
  required double increase,
  Value<DateTime?> createdAt,
});
typedef $$TrainingRecordsTableUpdateCompanionBuilder = TrainingRecordsCompanion
    Function({
  Value<int> id,
  Value<DateTime> trainBegin,
  Value<DateTime> trainEnd,
  Value<double> coinsBegin,
  Value<double> coinsEnd,
  Value<double> profit,
  Value<int> open,
  Value<int> prof,
  Value<int> loss,
  Value<double> rate,
  Value<int> totalDays,
  Value<int> days,
  Value<double> holdRate,
  Value<Uint8List> buys,
  Value<Uint8List> sells,
  Value<String> stock,
  Value<String> code,
  Value<DateTime> tradeBegin,
  Value<DateTime> tradeEnd,
  Value<Uint8List> klines,
  Value<double> increase,
  Value<DateTime?> createdAt,
});

class $$TrainingRecordsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TrainingRecordsTable,
    TrainingRecord,
    $$TrainingRecordsTableFilterComposer,
    $$TrainingRecordsTableOrderingComposer,
    $$TrainingRecordsTableProcessedTableManager,
    $$TrainingRecordsTableInsertCompanionBuilder,
    $$TrainingRecordsTableUpdateCompanionBuilder> {
  $$TrainingRecordsTableTableManager(
      _$AppDatabase db, $TrainingRecordsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TrainingRecordsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$TrainingRecordsTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$TrainingRecordsTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> trainBegin = const Value.absent(),
            Value<DateTime> trainEnd = const Value.absent(),
            Value<double> coinsBegin = const Value.absent(),
            Value<double> coinsEnd = const Value.absent(),
            Value<double> profit = const Value.absent(),
            Value<int> open = const Value.absent(),
            Value<int> prof = const Value.absent(),
            Value<int> loss = const Value.absent(),
            Value<double> rate = const Value.absent(),
            Value<int> totalDays = const Value.absent(),
            Value<int> days = const Value.absent(),
            Value<double> holdRate = const Value.absent(),
            Value<Uint8List> buys = const Value.absent(),
            Value<Uint8List> sells = const Value.absent(),
            Value<String> stock = const Value.absent(),
            Value<String> code = const Value.absent(),
            Value<DateTime> tradeBegin = const Value.absent(),
            Value<DateTime> tradeEnd = const Value.absent(),
            Value<Uint8List> klines = const Value.absent(),
            Value<double> increase = const Value.absent(),
            Value<DateTime?> createdAt = const Value.absent(),
          }) =>
              TrainingRecordsCompanion(
            id: id,
            trainBegin: trainBegin,
            trainEnd: trainEnd,
            coinsBegin: coinsBegin,
            coinsEnd: coinsEnd,
            profit: profit,
            open: open,
            prof: prof,
            loss: loss,
            rate: rate,
            totalDays: totalDays,
            days: days,
            holdRate: holdRate,
            buys: buys,
            sells: sells,
            stock: stock,
            code: code,
            tradeBegin: tradeBegin,
            tradeEnd: tradeEnd,
            klines: klines,
            increase: increase,
            createdAt: createdAt,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required DateTime trainBegin,
            required DateTime trainEnd,
            required double coinsBegin,
            required double coinsEnd,
            required double profit,
            required int open,
            required int prof,
            required int loss,
            required double rate,
            required int totalDays,
            required int days,
            required double holdRate,
            required Uint8List buys,
            required Uint8List sells,
            required String stock,
            required String code,
            required DateTime tradeBegin,
            required DateTime tradeEnd,
            required Uint8List klines,
            required double increase,
            Value<DateTime?> createdAt = const Value.absent(),
          }) =>
              TrainingRecordsCompanion.insert(
            id: id,
            trainBegin: trainBegin,
            trainEnd: trainEnd,
            coinsBegin: coinsBegin,
            coinsEnd: coinsEnd,
            profit: profit,
            open: open,
            prof: prof,
            loss: loss,
            rate: rate,
            totalDays: totalDays,
            days: days,
            holdRate: holdRate,
            buys: buys,
            sells: sells,
            stock: stock,
            code: code,
            tradeBegin: tradeBegin,
            tradeEnd: tradeEnd,
            klines: klines,
            increase: increase,
            createdAt: createdAt,
          ),
        ));
}

class $$TrainingRecordsTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $TrainingRecordsTable,
    TrainingRecord,
    $$TrainingRecordsTableFilterComposer,
    $$TrainingRecordsTableOrderingComposer,
    $$TrainingRecordsTableProcessedTableManager,
    $$TrainingRecordsTableInsertCompanionBuilder,
    $$TrainingRecordsTableUpdateCompanionBuilder> {
  $$TrainingRecordsTableProcessedTableManager(super.$state);
}

class $$TrainingRecordsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $TrainingRecordsTable> {
  $$TrainingRecordsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get trainBegin => $state.composableBuilder(
      column: $state.table.trainBegin,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get trainEnd => $state.composableBuilder(
      column: $state.table.trainEnd,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get coinsBegin => $state.composableBuilder(
      column: $state.table.coinsBegin,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get coinsEnd => $state.composableBuilder(
      column: $state.table.coinsEnd,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get profit => $state.composableBuilder(
      column: $state.table.profit,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get open => $state.composableBuilder(
      column: $state.table.open,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get prof => $state.composableBuilder(
      column: $state.table.prof,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get loss => $state.composableBuilder(
      column: $state.table.loss,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get rate => $state.composableBuilder(
      column: $state.table.rate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get totalDays => $state.composableBuilder(
      column: $state.table.totalDays,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get days => $state.composableBuilder(
      column: $state.table.days,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get holdRate => $state.composableBuilder(
      column: $state.table.holdRate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<Uint8List> get buys => $state.composableBuilder(
      column: $state.table.buys,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<Uint8List> get sells => $state.composableBuilder(
      column: $state.table.sells,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get stock => $state.composableBuilder(
      column: $state.table.stock,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get code => $state.composableBuilder(
      column: $state.table.code,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get tradeBegin => $state.composableBuilder(
      column: $state.table.tradeBegin,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get tradeEnd => $state.composableBuilder(
      column: $state.table.tradeEnd,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<Uint8List> get klines => $state.composableBuilder(
      column: $state.table.klines,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get increase => $state.composableBuilder(
      column: $state.table.increase,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$TrainingRecordsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $TrainingRecordsTable> {
  $$TrainingRecordsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get trainBegin => $state.composableBuilder(
      column: $state.table.trainBegin,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get trainEnd => $state.composableBuilder(
      column: $state.table.trainEnd,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get coinsBegin => $state.composableBuilder(
      column: $state.table.coinsBegin,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get coinsEnd => $state.composableBuilder(
      column: $state.table.coinsEnd,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get profit => $state.composableBuilder(
      column: $state.table.profit,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get open => $state.composableBuilder(
      column: $state.table.open,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get prof => $state.composableBuilder(
      column: $state.table.prof,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get loss => $state.composableBuilder(
      column: $state.table.loss,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get rate => $state.composableBuilder(
      column: $state.table.rate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get totalDays => $state.composableBuilder(
      column: $state.table.totalDays,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get days => $state.composableBuilder(
      column: $state.table.days,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get holdRate => $state.composableBuilder(
      column: $state.table.holdRate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<Uint8List> get buys => $state.composableBuilder(
      column: $state.table.buys,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<Uint8List> get sells => $state.composableBuilder(
      column: $state.table.sells,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get stock => $state.composableBuilder(
      column: $state.table.stock,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get code => $state.composableBuilder(
      column: $state.table.code,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get tradeBegin => $state.composableBuilder(
      column: $state.table.tradeBegin,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get tradeEnd => $state.composableBuilder(
      column: $state.table.tradeEnd,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<Uint8List> get klines => $state.composableBuilder(
      column: $state.table.klines,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get increase => $state.composableBuilder(
      column: $state.table.increase,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class _$AppDatabaseManager {
  final _$AppDatabase _db;
  _$AppDatabaseManager(this._db);
  $$TrainingRecordsTableTableManager get trainingRecords =>
      $$TrainingRecordsTableTableManager(_db, _db.trainingRecords);
}
