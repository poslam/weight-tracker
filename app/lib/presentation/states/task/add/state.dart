import 'package:freezed_annotation/freezed_annotation.dart';
part 'state.freezed.dart';

@freezed
class TaskAddState with _$TaskAddState {
  const factory TaskAddState.input() = _Input;
  const factory TaskAddState.updating() = _Updating;
  const factory TaskAddState.error({required String msg}) = _Error;
}
