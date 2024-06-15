import 'package:drift/drift.dart';
import 'package:todo/data/datasources/db.dart';
import 'package:todo/data/mappers/task.dart';
import 'package:todo/domain/entities/task.dart';
import 'package:todo/domain/repository/filter.dart';
import 'package:todo/domain/repository/task.dart';

class TaskRepositoryData implements TaskRepository {
  final AppDatabase db;
  final FilterRepository filterRepository;
  final TaskMapper taskMapper;

  TaskRepositoryData(
      {required this.filterRepository,
      required this.taskMapper,
      required this.db});

  @override
  Future<List<TaskEntity>> getTasks(String categoryId) async {
    final categoryData = db.select(db.taskModel)
      ..where((task) => task.categoryId.equals(categoryId));

    final query = await Future.wait((await categoryData.get())
        .map((task) => taskMapper.mapTaskModel(task))
        .toList());

    return query;
  }

  @override
  Future<TaskEntity> getTask(String taskId) async {
    final query = db.select(db.taskModel)
      ..where((task) => task.id.equals(taskId));

    return await taskMapper.mapTaskModel((await query.get()).first);
  }

  @override
  Future<void> addTask(TaskEntity task) async {
    db.into(db.taskModel).insert(await taskMapper.mapTaskEntity(task));
  }

  @override
  Future<void> editTask(String taskId, String name, String description) async {
    db.update(db.taskModel)
      ..where((task) => task.id.equals(taskId))
      ..write(TaskModelCompanion(
          name: Value(name.trim()), description: Value(description)));
  }

  @override
  Future<void> removeTask(String taskId) async {
    (db.delete(db.taskModel)..where((task) => task.id.equals(taskId))).go();
  }

  @override
  Future<void> completeTask(String taskId, bool isCompleted) async {
    db.update(db.taskModel)
      ..where((task) => task.id.equals(taskId))
      ..write(TaskModelCompanion(isCompleted: Value(isCompleted)));
  }

  @override
  Future<void> favourTask(String taskId, bool isFavourite) async {
    db.update(db.taskModel)
      ..where((task) => task.id.equals(taskId))
      ..write(TaskModelCompanion(isFavourite: Value(isFavourite)));
  }
}
