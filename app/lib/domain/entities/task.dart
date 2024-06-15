import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wtracker/domain/entities/img.dart';
part 'task.freezed.dart';

@freezed
class TaskEntity with _$TaskEntity {
  const factory TaskEntity({
    required String id,
    required String name,
    required DateTime createdAt,
    required String description,
    @Default(false) bool isCompleted,
    @Default(false) bool isFavourite,
    @Default([]) List<ImgEntity> imgUrls,
    required String categoryId,
  }) = _TaskEntity;
}
