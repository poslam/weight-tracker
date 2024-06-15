import 'package:wtracker/data/models/filter.dart';
import 'package:wtracker/domain/entities/task.dart';
import 'package:wtracker/domain/repository/filter.dart';

class FilterUseCase {
  final FilterRepository filterRepository;

  FilterUseCase({required this.filterRepository});

  Future<FilterStatus> getFilter(String categoryId) async {
    final filter = await filterRepository.getFilter(categoryId);

    return (filter == null) ? FilterStatus.uncompleted : filter.name;
  }

  Future<void> setFilter(FilterStatus status, String categoryId) async {
    await filterRepository.setFilter(status, categoryId);
  }

  Future<List<TaskEntity>> filterTasks(
      List<TaskEntity> tasks, String categoryId) async {
    FilterStatus filter = await getFilter(categoryId);

    tasks = switch (filter) {
      FilterStatus.completed =>
        tasks.where((task) => task.isCompleted).toList(),
      FilterStatus.uncompleted =>
        tasks.where((task) => !task.isCompleted).toList(),
      FilterStatus.all => tasks,
      FilterStatus.favourite =>
        tasks.where((task) => task.isFavourite).toList(),
    };

    return tasks;
  }
}
