import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wtracker/domain/entities/task.dart';
import 'package:wtracker/domain/usecases/task.dart';
import 'package:wtracker/presentation/states/task/list/bloc.dart';
import 'state.dart';

class TaskEditBloc extends Cubit<TaskEditState> {
  final TaskUseCase _taskUseCase;
  final TaskListBloc _taskListBloc;

  TaskEditBloc(this._taskUseCase, this._taskListBloc)
      : super(const TaskEditState.init());

  Future<bool> editTask(String taskId, String name, String description) async {
    try {
      final TaskEntity task = await _taskUseCase.getTask(taskId);

      await _taskUseCase.editTask(taskId, name, description);

      await _taskListBloc.refresh(task.categoryId);
    } catch (e) {
      emit(TaskEditState.error(msg: e.toString()));
      return true;
    }
    return true;
  }

  Future<void> refresh(String taskId) async {
    emit(const TaskEditState.init());
    final TaskEntity task = await _taskUseCase.getTask(taskId);
    await _taskListBloc.refresh(task.categoryId);
    emit(TaskEditState.input(task));
  }
}
