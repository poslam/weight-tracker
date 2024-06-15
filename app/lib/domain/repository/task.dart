import 'package:wtracker/domain/entities/task.dart';

abstract class TaskRepository {
  Future<List<TaskEntity>> getTasks(String categoryId);

  Future<TaskEntity> getTask(String taskId);

  Future<void> addTask(TaskEntity task);

  Future<void> editTask(String taskId, String name, String description);

  Future<void> removeTask(String taskId);

  Future<void> completeTask(String taskId, bool isCompleted);

  Future<void> favourTask(String taskId, bool isFavourite);
}
