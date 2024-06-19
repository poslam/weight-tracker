import 'package:logger/logger.dart';

import '../core/utils/json.dart';
import 'event.dart';
import 'storage.dart'; // Import dart:convert library

class AppLogger {
  static final _logger = Logger();

  static void api(LoggerEvent message) {
    final messageString =
        "--------------- API ---------------\n${prettyJson(message.toJson())}";
    LoggerStorage.addApiEvent(message);
    _logger.i(messageString);
  }

  static void repository(LoggerEvent message) {
    final messageString =
        "----------- RESPOSITORY -----------\n${prettyJson(message.toJson())}";
    LoggerStorage.addRepositoryEvent(message);
    _logger.i(messageString);
  }

  static void bloc(LoggerEvent message) {
    final messageString =
        "--------------- BLOC ---------------\n${prettyJson(message.toJson())}";
    _logger.i(messageString);
  }

  static void ui(LoggerEvent message) {
    final messageString =
        "---------------- UI ----------------\n${prettyJson(message.toJson())}";
    _logger.i(messageString);
  }
}
