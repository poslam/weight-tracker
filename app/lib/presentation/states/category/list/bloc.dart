import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/domain/usecases/category.dart';
import 'state.dart';

class CategoryListBloc extends Cubit<CategoryListState> {
  final CategoryUseCase _categoryUseCase;

  CategoryListBloc(this._categoryUseCase)
      : super(const CategoryListState.loading());

  Future<void> refresh() async {
    final data = await _categoryUseCase.getCategories();

    emit(CategoryListState.data(data: data));
  }

  Future<bool> removeCategory(String categoryName) async {
    try {
      await _categoryUseCase.removeCategory(categoryName);
      await refresh();
    } catch (e) {
      emit(CategoryListState.error(msg: e.toString()));
      return true;
    }

    return true;
  }
}
