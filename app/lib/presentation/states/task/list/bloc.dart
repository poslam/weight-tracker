import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wtracker/domain/entities/task.dart';
import 'package:wtracker/domain/usecases/task.dart';
import 'state.dart';

class TaskListBloc extends Cubit<TaskListState> {
  final TaskUseCase _taskUseCase;

  TaskListBloc(this._taskUseCase) : super(const TaskListState.loading());

  Future<void> refresh(String categoryId) async {
    final data = await _taskUseCase.getTasks(categoryId);

    emit(TaskListState.data(data: data));
  }

  Future<bool> removeTask(String taskId) async {
    try {
      final TaskEntity task = await _taskUseCase.getTask(taskId);

      await _taskUseCase.removeTask(task.id);

      await refresh(task.categoryId);
    } catch (e) {
      emit(TaskListState.error(msg: e.toString()));
      return true;
    }

    return true;
  }

  Future<void> favourTask(String taskId, bool isFavourite) async {
    await _taskUseCase.favourTask(taskId, isFavourite);
  }

  Future<void> completeTask(String taskId, bool isCompleted) async {
    await _taskUseCase.completeTask(taskId, isCompleted);
  }
}
