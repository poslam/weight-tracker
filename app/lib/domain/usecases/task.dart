import 'package:todo/data/mappers/task.dart';
import 'package:todo/domain/entities/img.dart';
import 'package:todo/domain/entities/task.dart';
import 'package:todo/domain/repository/task.dart';
import 'package:todo/domain/usecases/filter.dart';
import 'package:todo/domain/usecases/img.dart';
import 'package:uuid/uuid.dart';

class TaskUseCase {
  final FilterUseCase filterUseCase;
  final ImgUseCase imgUseCase;
  final TaskRepository taskRepository;
  final TaskMapper taskMapper;

  TaskUseCase({
    required this.filterUseCase,
    required this.taskRepository,
    required this.taskMapper,
    required this.imgUseCase,
  });

  Future<List<TaskEntity>> getTasks(String categoryId) async {
    List<TaskEntity> tasks = await taskRepository.getTasks(categoryId);

    tasks = await filterUseCase.filterTasks(tasks, categoryId);

    tasks.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    tasks.sort((a, b) => b.isFavourite ? 1 : -1);

    late final List<TaskEntity> result = [];

    for (TaskEntity task in tasks) {
      final List<ImgEntity> imgUrls = await imgUseCase.getImgsOfTask(task.id);

      if (imgUrls.isEmpty) {
        result.add(task);
        continue;
      }
      final taskWithImgs = task.copyWith(imgUrls: imgUrls);
      result.add(taskWithImgs);
    }

    return result;
  }

  Future<TaskEntity> getTask(String taskId) async {
    final TaskEntity task = await taskRepository.getTask(taskId);
    final List<ImgEntity> imgUrls = await imgUseCase.getImgsOfTask(task.id);

    return task.copyWith(imgUrls: imgUrls);
  }

  Future<void> addTask(
      String name, String description, String categoryId) async {
    TaskEntity newTask = TaskEntity(
      id: const Uuid().v8(),
      name: name.trim(),
      createdAt: DateTime.now(),
      description: description.trim(),
      categoryId: categoryId,
    );

    await taskRepository.addTask(newTask);
  }

  Future<void> editTask(String taskId, String name, String description) async {
    await taskRepository.editTask(taskId, name.trim(), description);
  }

  Future<void> removeTask(String taskId) async {
    await taskRepository.removeTask(taskId);
  }

  Future<void> completeTask(String taskId, bool isCompleted) async {
    await taskRepository.completeTask(taskId, isCompleted);
  }

  Future<void> favourTask(String taskId, bool isFavourite) async {
    await taskRepository.favourTask(taskId, isFavourite);
  }
}
