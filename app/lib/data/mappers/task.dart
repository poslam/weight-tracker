import 'package:drift/drift.dart';
import 'package:todo/data/datasources/db.dart';
import 'package:todo/domain/entities/task.dart';

class TaskMapper {
  Future<TaskModelCompanion> mapTaskEntity(TaskEntity task) async {
    TaskModelCompanion taskModel = TaskModelCompanion(
      id: Value(task.id),
      name: Value(task.name),
      createdAt: Value(task.createdAt),
      description: Value(task.description),
      isCompleted: Value(task.isCompleted),
      isFavourite: Value(task.isFavourite),
      categoryId: Value(task.categoryId),
    );

    return taskModel;
  }

  Future<TaskEntity> mapTaskModel(TaskModelData task) async {
    return TaskEntity(
      id: task.id.toString(),
      name: task.name.toString(),
      createdAt: DateTime.parse(task.createdAt.toString()),
      description: task.description.toString(),
      isCompleted: task.isCompleted.toString() == 'true',
      isFavourite: task.isFavourite.toString() == 'true',
      categoryId: task.categoryId.toString(),
    );
  }
}
