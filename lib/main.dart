import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import './screens/home.dart';
import 'screens/loading_screen.dart';
import 'screens/trading.dart';
import 'version.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  updateAndroidApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (_, __) => const HomePage(),
        routes: [
          GoRoute(
            path: 'loading',
            builder: (_, __) => const LoadingScreen(),
          ),
          GoRoute(
            path: 'trading',
            builder: (_, __) => const TradingScreen(),
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
        child: MaterialApp.router(
      title: '利弗莫尔',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router,
    ));
  }
}
