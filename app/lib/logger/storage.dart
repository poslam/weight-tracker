import 'event.dart';

class LoggerStorage {
  static final List<LoggerEvent> uiEvent = [];
  static final List<LoggerEvent> apiEvent = [];
  static final List<LoggerEvent> repositoryEvent = [];

  static void addUiEvent(LoggerEvent event) {
    uiEvent.add(event);
  }

  static void addApiEvent(LoggerEvent event) {
    apiEvent.add(event);
  }

  static void addRepositoryEvent(LoggerEvent event) {
    repositoryEvent.add(event);
  }
}
