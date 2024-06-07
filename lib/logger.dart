import 'dart:io';

import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
// https://pub.dev/packages/logger

var logger = Logger(
  printer: PrettyPrinter(
    printEmojis: false,
  ),
);

var loggerNoStack = Logger(
  level: Level.info,
  // level: Level.debug,
  printer: PrettyPrinter(
    methodCount: 0,
    printEmojis: false,
  ),
);
