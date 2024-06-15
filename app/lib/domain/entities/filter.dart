import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wtracker/data/models/filter.dart';
import 'package:wtracker/i18n/strings.g.dart';
part 'filter.freezed.dart';

@freezed
class FilterEntity with _$FilterEntity {
  const factory FilterEntity({
    required FilterStatus name,
    required String categoryId,
  }) = _FilterEntity;
}

Map<FilterStatus, String> filtersMap = {
  FilterStatus.all: t.task.allTasks,
  FilterStatus.completed: t.task.completedTasks,
  FilterStatus.uncompleted: t.task.uncompletedTasks,
  FilterStatus.favourite: t.task.favouriteTasks,
};
