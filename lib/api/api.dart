import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../pkg/chart/badge_chart.dart';
import '../pkg/chart/bar_chart.dart';
import '../pkg/chart/base_chart.dart';
import '../pkg/chart/candlestick_chart.dart';
import '../pkg/common/kline_config.dart';

var headers = {
  "Accept-Language": "zh-CN,zh;q=0.8",
  'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 '
      '(KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36',
  "Cache-Control": "no-cache",
};

class TrainKLine {
  final String tradeDate; // 交易日
  final double open; // 开盘价
  final double close; // 收盘价
  final double high; // 最高价
  final double low; //最低价
  final double vol; // 成交量
  final double amount; //成交额
  final double amplitude; //振幅
  final double pct; //涨跌幅
  final double changes; //涨跌额
  final double turnoverRate; //换手率

  TrainKLine(
      this.tradeDate,
      this.open,
      this.close,
      this.high,
      this.low,
      this.vol,
      this.amount,
      this.amplitude,
      this.pct,
      this.changes,
      this.turnoverRate);

  TrainKLine.fromList(List list)
      : tradeDate = list[0] as String,
        open = double.parse(list[1]),
        close = double.parse(list[2]),
        high = double.parse(list[3]),
        low = double.parse(list[4]),
        vol = double.parse(list[5]),
        amount = double.parse(list[6]),
        amplitude = double.parse(list[7]),
        pct = double.parse(list[8]),
        changes = double.parse(list[9]),
        turnoverRate = double.parse(list[10]);

  TrainKLine.fromJson(Map<String, dynamic> json)
      : tradeDate = json['tradeDate'] as String,
        open = json['open'] as double,
        close = json['close'] as double,
        high = json['high'] as double,
        low = json['low'] as double,
        vol = json['vol'] as double,
        amount = json['amount'] as double,
        amplitude = json['amplitude'] as double,
        pct = json['pct'] as double,
        changes = json['changes'] as double,
        turnoverRate = json['turnoverRate'] as double;

  Map<String, dynamic> toJson() => {
        'tradeDate': tradeDate,
        'open': open,
        'close': close,
        'high': high,
        'low': low,
        'vol': vol,
        'amount': amount,
        'amplitude': amplitude,
        'pct': pct,
        'changes': changes,
        'turnoverRate': turnoverRate
      };

  DateTime parseTradeDate() {
    int year = int.parse(tradeDate.substring(0, 4));
    int month = int.parse(tradeDate.substring(5, 7));
    int day = int.parse(tradeDate.substring(8, 10));
    return DateTime(year, month, day);
  }
}

class TrainData {
  final String stockName;
  final String stockCode;
  final double prePrice;
  final List<TrainKLine> kLines;

  TrainData(this.stockName, this.stockCode, this.prePrice, this.kLines);

  TrainData.fromJson(Map<String, dynamic> json)
      : stockName = json['name'] as String,
        stockCode = json['code'] as String,
        prePrice = json["preKPrice"] as double,
        kLines = (json['klines'] as List)
            .map((i) => TrainKLine.fromList(i.split(',')))
            .toList();

  Map<String, dynamic> toJson() => {
        'name': stockName,
        'code': stockCode,
        'preKPrice': prePrice,
        'klines': kLines
      };

  List<BaseChart> toBaseChartList() {
    List<BaseChart> charts = [];

    List<CandlestickChartData> candlesticks = [];
    List<BarChartData> bars = [];
    List<BadgeChartData?> badges = [];

    for (var k in kLines) {
      candlesticks.add(CandlestickChartData(
          id: k.tradeDate,
          dateTime: k.parseTradeDate(),
          open: k.open,
          close: k.close,
          high: k.high,
          low: k.low));

      Color color = k.pct < 0 ? KlineConfig.green : KlineConfig.red;

      bars.add(BarChartData(
          id: k.tradeDate, value: k.vol, color: color, isFill: k.pct < 0));

      badges.add(null);
    }

    charts.add(CandlestickChart(id: 'Candlestick', data: candlesticks));
    charts.add(BarChart(id: 'Volume', data: bars));
    charts.add(BadgeChart(id: 'Badge', data: badges));

    return charts;
  }
}

var baseParams = {
  'fields1': 'f1,f2,f3,f4,f5,f6',
  'fields2': 'f51,f52,f53,f54,f55,f56,f57,f58,f59,f60,f61',
  'ut': 'fa5fd1943c7b386f172d6893dbfba10b',
  'klt': '101',
  'fqt': '1',
  '_': '1716373208874',
};

final _dateFormat = DateFormat('yyyyMMdd');

Future<TrainData> getTrainData(String code, DateTime begin,
    {DateTime? end}) async {
  if (code.startsWith('6')) {
    code = '1.$code';
  } else if (code.startsWith('0') || code.startsWith('3')) {
    code = '0.$code';
  }

  end ??= DateTime(2050, 1, 1);

  var params = baseParams;
  params['secid'] = code;
  params['beg'] = _dateFormat.format(begin);
  params['end'] = _dateFormat.format(end);

  var response = await http.get(
    Uri.parse('https://push2his.eastmoney.com/api/qt/stock/kline/get')
        .replace(queryParameters: params),
    headers: headers,
  );

  Map<String, dynamic> body = jsonDecode(utf8.decode(response.bodyBytes));

  return TrainData.fromJson(body['data']);
}
