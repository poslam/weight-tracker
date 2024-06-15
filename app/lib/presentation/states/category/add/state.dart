import 'package:freezed_annotation/freezed_annotation.dart';
part 'state.freezed.dart';

@freezed
class CategoryAddState with _$CategoryAddState {
  const factory CategoryAddState.input() = _Input;
  const factory CategoryAddState.updating() = _Updating;
  const factory CategoryAddState.error({required String msg}) = _Error;
}
