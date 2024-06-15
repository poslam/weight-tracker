import 'package:freezed_annotation/freezed_annotation.dart';
part 'state.freezed.dart';

@freezed
class CategoryEditState with _$CategoryEditState {
  const factory CategoryEditState.input() = _Input;
  const factory CategoryEditState.updating() = _Updating;
  const factory CategoryEditState.error({required String msg}) = _Error;
}