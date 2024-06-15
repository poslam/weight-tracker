import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/domain/usecases/category.dart';
import 'package:todo/i18n/strings.g.dart';
import 'package:todo/presentation/states/category/list/bloc.dart';
import 'state.dart';

class CategoryEditBloc extends Cubit<CategoryEditState> {
  final CategoryUseCase _categoryUseCase;
  final CategoryListBloc _categoryListBloc;

  CategoryEditBloc(this._categoryUseCase, this._categoryListBloc)
      : super(const CategoryEditState.input());

  Future<bool> editCategory(
      {required String newCategoryName,
      required String oldCategoryName}) async {
    try {
      emit(const CategoryEditState.input());

      if (!await _categoryUseCase.isValidCategoryName(newCategoryName)) {
        emit(CategoryEditState.error(msg: t.category.alreadyExists));
        return false;
      }

      await _categoryUseCase.editCategory(newCategoryName, oldCategoryName);
      await _categoryListBloc.refresh();
    } catch (e) {
      emit(CategoryEditState.error(msg: e.toString()));
      return true;
    }

    return true;
  }

  Future<void> refresh() async {
    emit(const CategoryEditState.input());
  }
}
