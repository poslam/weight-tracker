import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wtracker/data/models/filter.dart';
import 'package:wtracker/domain/usecases/filter.dart';
import 'package:wtracker/presentation/states/task/list/bloc.dart';
import 'state.dart';

class FilterListBloc extends Cubit<FilterListState> {
  final FilterUseCase _filterUseCase;
  final TaskListBloc _taskListBloc;

  FilterListBloc(this._filterUseCase, this._taskListBloc)
      : super(const FilterListState.loading());

  Future<void> refresh(String categoryId) async {
    final FilterStatus data = await _filterUseCase.getFilter(categoryId);

    emit(FilterListState.data(data: data));

    await _taskListBloc.refresh(categoryId);
  }

  Future<void> setFilter(String categoryId, FilterStatus filterStatus) async {
    try {
      await _filterUseCase.setFilter(filterStatus, categoryId);
      await refresh(categoryId);
    } catch (e) {
      emit(FilterListState.error(msg: e.toString()));
    }
  }

  Future<FilterStatus?> getFilter(String categoryId) async {
    return _filterUseCase.getFilter(categoryId);
  }
}
