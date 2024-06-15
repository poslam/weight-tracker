import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wtracker/domain/entities/task.dart';
part 'state.freezed.dart';

@freezed
class TaskListState with _$TaskListState {
  const factory TaskListState.loading() = _Loading;
  const factory TaskListState.data({
    required List<TaskEntity> data,
  }) = _Data;
  const factory TaskListState.error({required String msg}) = _Error;
}
