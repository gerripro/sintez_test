import 'package:logger/logger.dart';

/// it is a debug logger. it shouldn't be used in production.
final Logger debugLogger = Logger(
  printer: PrettyPrinter(
    errorMethodCount: 5,
    lineLength: 10,
  ),
);