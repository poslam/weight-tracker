import 'package:freezed_annotation/freezed_annotation.dart';
part 'category.freezed.dart';

@freezed
class CategoryEntity with _$CategoryEntity {
  const factory CategoryEntity({
    required String id,
    required String name,
    required DateTime createdAt,
  }) = _CategoryEntity;
}
