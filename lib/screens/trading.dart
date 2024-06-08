import 'dart:convert';

import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:livermore/screens/home/state.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:wakelock/wakelock.dart';

import '../api/api.dart';
import '../db/db.dart';
import '../pkg/chart/badge_chart.dart';
import '../pkg/chart/base_chart.dart';
import '../pkg/common/chart_data.dart';
import '../pkg/common/k_chart_data_source.dart';
import '../pkg/widget/bs_point_widget.dart';
import '../pkg/widget/k_chart_widget.dart';
import 'trading/base_info_banner.dart';
import 'trading/state.dart';
import 'trading/trading_result_dialog.dart';
import 'trading/trading_results_banner.dart';

const int N = 40; // 可参考数量

const style = TextStyle(color: Colors.white, fontSize: 16);

class TradingScreen extends ConsumerStatefulWidget {
  const TradingScreen({super.key});

  @override
  ConsumerState<TradingScreen> createState() => _TradingScreenState();
}

class _TradingScreenState extends ConsumerState<TradingScreen> {
  late TrainData _trainData; // 训练数据

  late double _coinsBegin; // 初始硬币
  late double _coinsLast; // 最新初始硬币
  late double _coinsEnd; // 最终硬币

  late BaseChart _baseChart0; // 蜡烛图
  late BaseChart _baseChart1; // 成交量图
  late BaseChart _baseChart2; // 买卖点标记图

  late int _total; // 全部天数
  late int _days; // 持仓天数
  late int _currentDay; // 最新交易日序号

  late int open; // 开仓次数
  late int loss; // 亏钱次数
  late bool _purchased; // 已买入
  double? _price; // 买入价格
  late List<bool> _buys; // 买点列表
  late List<bool> _sells; // 卖点列表

  late DateTime _trainBegin; // 训练开始时间

  final int _duration = 5; // 倒计时
  late CountdownController _controller; // 倒计时控制器

  late KChartDataSource _source; // 数据源

  bool _status = false;

  @override
  void initState() {
    _controller = CountdownController(autoStart: true);
    super.initState();
    Wakelock.enable();
  }

  @override
  void dispose() {
    _source.dispose();
    Wakelock.disable();
    super.dispose();
  }

  void initData() {
    if (_status) {
      return;
    }

    _status = true;

    _days = 0;
    _currentDay = N;
    open = 0;
    loss = 0;
    _purchased = false;
    _price = null; // 更新卖出价格

    _coinsBegin = currentCoins;
    _coinsLast = currentCoins;
    _coinsEnd = currentCoins;

    _total = _trainData.kLines.length;

    _buys = List<bool>.filled(_total, false);
    _sells = List<bool>.filled(_total, false);

    var baseCharts = _trainData.toBaseChartList();

    _baseChart0 = baseCharts[0];
    _baseChart1 = baseCharts[1];
    _baseChart2 = baseCharts[2];

    int pos = _currentDay - 2;
    _baseChart2.data[pos] = BadgeChartData(
      id: _trainData.kLines[pos].tradeDate,
      dateTime: _trainData.kLines[pos].parseTradeDate(),
      minSize: const Size(20, 30),
      widget: const BsPointWidget(text: "起", color: Colors.purple),
      invertWidget:
          const BsPointWidget(text: "起", color: Colors.purple, invert: true),
      value: _trainData.kLines[pos].high,
      invertValue: _trainData.kLines[pos].low,
      putMode: BadgePutMode.invert,
    );

    _source = KChartDataSource(originCharts: [
      ChartData(id: '0', name: 'MA', baseCharts: [
        _baseChart0.subData(start: 0, end: _currentDay),
        _baseChart2.subData(start: 0, end: _currentDay - 1),
      ]),
      ChartData(id: '1', name: 'VOL', baseCharts: [
        _baseChart1.subData(start: 0, end: _currentDay),
      ]),
    ]);

    _trainBegin = DateTime.now();

    _controller.restart();
  }

  void goToNextTradingDay({bool buy = false, bool sell = false}) {
    if (buy) {
      open++; // 开仓次数
      _purchased = true; // 已买入
      _buys[_currentDay - 1] = true; // 添加买点
      _price = _trainData.kLines[_currentDay - 1].close; // 更新买入价格

      _baseChart2.data[_currentDay - 1] = BadgeChartData(
        id: _trainData.kLines[_currentDay - 1].tradeDate,
        dateTime: _trainData.kLines[_currentDay - 1].parseTradeDate(),
        minSize: const Size(20, 30),
        widget: const BsPointWidget.buy(),
        invertWidget: const BsPointWidget.buy(invert: true),
        value: _trainData.kLines[_currentDay - 1].open,
        invertValue: _trainData.kLines[_currentDay - 1].close,
        putMode: BadgePutMode.invert,
      );
    }

    if (_purchased && !sell) {
      _days++; // 持仓天数

      var price = _trainData.kLines[_currentDay].close;
      var pct = (price - _price!) / _price!;

      _coinsEnd = _coinsLast * (1 + pct); // 暂时假定可以全额买入
    }

    if (sell) {
      if (_coinsEnd < _coinsLast) {
        loss++; // 盈利次数
      }

      _coinsLast = _coinsEnd;

      _purchased = false; // 已卖出
      _sells[_currentDay - 1] = true; // 添加卖点
      _price = null; // 更新卖出价格

      _baseChart2.data[_currentDay - 1] = BadgeChartData(
        id: _trainData.kLines[_currentDay - 1].tradeDate,
        dateTime: _trainData.kLines[_currentDay - 1].parseTradeDate(),
        minSize: const Size(20, 30),
        widget: const BsPointWidget.sell(color: Colors.blue),
        invertWidget:
            const BsPointWidget.sell(color: Colors.blue, invert: true),
        value: _trainData.kLines[_currentDay - 1].open,
        invertValue: _trainData.kLines[_currentDay - 1].close,
        putMode: BadgePutMode.invert,
      );
    }

    // 添加次日数据
    var newCharts = [
      ChartData(id: '0', baseCharts: [
        _baseChart0.subData(start: _currentDay, end: _currentDay + 1),
        _baseChart2.subData(start: _currentDay - 1, end: _currentDay),
      ]),
      ChartData(id: '1', baseCharts: [
        _baseChart1.subData(start: _currentDay, end: _currentDay + 1)
      ]),
    ];

    _source.updateData(newCharts: newCharts, isEnd: true);
    _source.notifyListeners();

    // 下一日
    _currentDay++;

    // 重绘
    setState(() {});

    // 重启倒计时
    _controller.restart();

    // 交易结束
    if (_currentDay == _total) {
      complete();
    }
  }

  void complete() {
    _controller.pause();

    DateTime tradeBegin = _trainData.kLines[N - 1].parseTradeDate();
    DateTime tradeEnd = _trainData.kLines[_total - 1].parseTradeDate();
    double priceBegin = _trainData.kLines[N - 1].close;
    double priceEnd = _trainData.kLines[_total - 1].close;

    var record = TrainingRecordsCompanion(
      trainBegin: Value(_trainBegin),
      trainEnd: Value(DateTime.now()),
      coinsBegin: Value(_coinsBegin),
      coinsEnd: Value(_coinsEnd),
      profit: Value((_coinsEnd - _coinsBegin) / _coinsBegin * 100),
      open: Value(open),
      prof: Value(open - loss),
      loss: Value(loss),
      rate: Value((open - loss) / open * 100),
      totalDays: Value(_total),
      days: Value(_days),
      holdRate: Value(_days / _total * 100),
      buys: Value(utf8.encode(jsonEncode(_buys))),
      sells: Value(utf8.encode(jsonEncode(_sells))),
      stock: Value(_trainData.stockName),
      code: Value(_trainData.stockCode),
      tradeBegin: Value(tradeBegin),
      tradeEnd: Value(tradeEnd),
      klines: Value(utf8.encode(jsonEncode(_trainData.kLines))),
      increase: Value((priceEnd - priceBegin) / priceBegin * 100),
    );

    if (_days != 0) {
      final database = ref.read(AppDatabase.provider);
      database.trainingRecords.insertOne(record);
    }

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return PopScope(
              canPop: false,
              onPopInvoked: (bool didPop) => {},
              child: TradingResultDialog(
                record: record,
                onPressed: () {
                  ref.refresh(trainDataFutureProvider.future).then((onValue) {
                    _status = false;
                    Navigator.of(context).pop();
                  });
                },
              ));
        });
  }

  void showExitTradingDialog() {
    _controller.pause();

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('确定退出模拟交易吗?',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 18)),
            content: const Text('交易尚未完成，此时退出仍将计算收益。确定退出吗?',
                style: TextStyle(color: Colors.black, fontSize: 16)),
            actions: [
              TextButton(
                child: const Text('取消'),
                onPressed: () {
                  Navigator.of(context).pop();
                  _controller.resume();
                },
              ),
              TextButton(
                child: const Text('确认'),
                onPressed: () {
                  if (_days == 0) {
                    context.go('/');
                  } else {
                    Navigator.of(context).pop();
                    complete();
                  }
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var trainData = ref.watch(trainDataFutureProvider);

    return trainData.when(
      data: (entry) {
        if (entry.kLines.length < N + 30 ||
            entry.stockName.startsWith('ST') ||
            entry.prePrice < 3 ||
            entry.stockName.startsWith('XD') ||
            entry.stockName.startsWith('*')) {
          ref.refresh(trainDataFutureProvider.future);
          return const ColoredBox(
            color: Colors.white,
            child: Center(child: CircularProgressIndicator()),
          );
        } else {
          _trainData = entry;

          initData();

          return Scaffold(
              appBar: AppBar(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => showExitTradingDialog(),
                  ),
                  title: Row(
                    children: [
                      const Text('模拟交易进行中...', style: style),
                      const Spacer(),
                      Column(
                        children: [
                          const Text('天数',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14)),
                          Text('$_currentDay/$_total', style: style)
                        ],
                      ),
                      const Spacer(),
                      Column(children: [
                        const Text('倒计时',
                            style:
                                TextStyle(color: Colors.white, fontSize: 14)),
                        Countdown(
                          controller: _controller,
                          seconds: _duration,
                          build: (_, double time) => Text(
                            "${time.toInt()}",
                            style: style,
                          ),
                          onFinished: () => goToNextTradingDay(),
                          // onFinished: () => {},
                        ),
                      ]),
                    ],
                  )),
              body: PopScope(
                canPop: false,
                onPopInvoked: (bool didPop) => showExitTradingDialog(),
                child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Column(
                      children: [
                        BaseInfoBanner(
                            kLine: _trainData.kLines[_currentDay - 1]),
                        Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: KChartWidget(
                              showDataNum: N,
                              // dataGapRatio: 1,
                              source: _source,
                              realTimePrice: _price, // 标记当前买入价
                            )),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            TextButton(
                              style: ButtonStyle(
                                  padding: WidgetStateProperty.all<EdgeInsets>(
                                      const EdgeInsets.fromLTRB(
                                          20, 12, 20, 12)),
                                  backgroundColor:
                                      WidgetStateProperty.all<Color>(
                                    Colors.deepPurpleAccent,
                                  ),
                                  shape: WidgetStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  )),
                              onPressed: () => complete(),
                              child: const Text('结算', style: style),
                            ),
                            const Spacer(),
                            TextButton(
                                style: ButtonStyle(
                                    padding:
                                        WidgetStateProperty.all<EdgeInsets>(
                                            const EdgeInsets.fromLTRB(
                                                20, 12, 20, 12)),
                                    backgroundColor:
                                        WidgetStateProperty.all<Color>(
                                      !_purchased ? Colors.grey : Colors.green,
                                    ),
                                    shape: WidgetStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    )),
                                onPressed: () => _purchased
                                    ? goToNextTradingDay(sell: true)
                                    : null,
                                child: const Text('卖出', style: style)),
                            const Spacer(),
                            TextButton(
                                style: ButtonStyle(
                                    padding:
                                        WidgetStateProperty.all<EdgeInsets>(
                                            const EdgeInsets.fromLTRB(
                                                20, 12, 20, 12)),
                                    backgroundColor:
                                        WidgetStateProperty.all<Color>(
                                      _purchased ? Colors.grey : Colors.red,
                                    ),
                                    shape: WidgetStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    )),
                                onPressed: () => !_purchased
                                    ? goToNextTradingDay(buy: true)
                                    : null,
                                child: const Text('买入', style: style)),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          child: TradingResultsBanner(
                              coinsEnd: _coinsEnd,
                              coinsBegin: _coinsBegin,
                              coinsLast: _coinsLast),
                        ),
                      ],
                    )),
              ));
        }
      },
      error: (e, s) {
        return Align(
          alignment: Alignment.center,
          child: Text(
            e.toString(),
            style: const TextStyle(color: Colors.red, fontSize: 12),
          ),
        );
      },
      loading: () => const ColoredBox(
        color: Colors.white,
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
