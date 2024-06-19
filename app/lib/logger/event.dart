import 'package:freezed_annotation/freezed_annotation.dart';

part '../.gen/logger/event.freezed.dart';
part '../.gen/logger/event.g.dart';

@freezed
class LoggerEvent with _$LoggerEvent {
  const factory LoggerEvent(
    String name,
    Map<String, String> data,
  ) = _LoggerEvent;

  factory LoggerEvent.fromJson(Map<String, dynamic> json) =>
      _$LoggerEventFromJson(json);
}
