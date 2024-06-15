import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wtracker/domain/usecases/category.dart';
import 'package:wtracker/i18n/strings.g.dart';
import 'package:wtracker/presentation/states/category/list/bloc.dart';
import 'state.dart';

class CategoryAddBloc extends Cubit<CategoryAddState> {
  final CategoryUseCase _categoryUseCase;
  final CategoryListBloc _categoryListBloc;

  CategoryAddBloc(this._categoryUseCase, this._categoryListBloc)
      : super(const CategoryAddState.input());

  Future<bool> addCategory(String newCategoryName) async {
    try {
      emit(const CategoryAddState.input());

      if (!await _categoryUseCase.isValidCategoryName(newCategoryName)) {
        emit(CategoryAddState.error(msg: t.category.alreadyExists));
        return false;
      }
      await _categoryUseCase.addCategory(newCategoryName);
      await _categoryListBloc.refresh();
    } catch (e) {
      emit(CategoryAddState.error(msg: e.toString()));
      return true;
    }
    return true;
  }

  Future<void> refresh() async {
    emit(const CategoryAddState.input());
  }
}
