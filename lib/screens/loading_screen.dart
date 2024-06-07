import 'package:flutter/material.dart';
import 'package:livermore/api/codes.dart';

import '../api/api.dart';
import './trade_screen.dart';
import 'home/state.dart';
import 'trading/state.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    var code = getRandomStockCode();
    var dateRange = DateRange.random();

    return FutureBuilder(
        future: getTrainData(code, dateRange.begin, end: dateRange.end),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return TradeScreen(trainData: snapshot.data!, coins: currentCoins);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          // By default, show a loading spinner.
          return const Align(
            alignment: Alignment.center,
            child: CircularProgressIndicator(
              color: Colors.black,
              backgroundColor: Colors.white,
            ),
          );
        });
  }
}
