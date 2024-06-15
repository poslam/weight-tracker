import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wtracker/domain/usecases/task.dart';
import 'package:wtracker/presentation/states/task/list/bloc.dart';
import 'state.dart';

class TaskAddBloc extends Cubit<TaskAddState> {
  final TaskUseCase _taskUseCase;
  final TaskListBloc _taskListBloc;

  TaskAddBloc(this._taskUseCase, this._taskListBloc)
      : super(const TaskAddState.input());

  Future<bool> addTask(
      String name, String description, String categoryId) async {
    try {
      emit(const TaskAddState.input());

      await _taskUseCase.addTask(name, description, categoryId);
      await _taskListBloc.refresh(categoryId);
    } catch (e) {
      emit(TaskAddState.error(msg: e.toString()));
      return true;
    }
    return true;
  }

  Future<void> refresh() async {
    emit(const TaskAddState.input());
  }
}
