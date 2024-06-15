import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo/data/models/filter.dart';
part 'state.freezed.dart';

@freezed
class FilterListState with _$FilterListState {
  const factory FilterListState.loading() = _Loading;
  const factory FilterListState.data({required FilterStatus data}) = _Data;
  const factory FilterListState.error({required String msg}) = _Error;
}
