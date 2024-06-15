import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wtracker/domain/entities/task.dart';
part 'state.freezed.dart';

@freezed
class TaskEditState with _$TaskEditState {
  const factory TaskEditState.init() = _Init;
  const factory TaskEditState.input(TaskEntity data) = _Input;
  const factory TaskEditState.error({required String msg}) = _Error;
}
