import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wtracker/domain/entities/category.dart';
part 'state.freezed.dart';

@freezed
class CategoryListState with _$CategoryListState {
  const factory CategoryListState.loading() = _Loading;
  const factory CategoryListState.data({
    required List<CategoryEntity> data,
  }) = _Data;
  const factory CategoryListState.error({required String msg}) = _Error;
}
