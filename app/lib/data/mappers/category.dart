import 'package:drift/drift.dart';
import 'package:todo/data/datasources/db.dart';
import 'package:todo/domain/entities/category.dart';

class CategoryMapper {
  Future<CategoryModelCompanion> mapCategoryEntity(
      CategoryEntity category) async {
    CategoryModelCompanion categoryModel = CategoryModelCompanion(
      id: Value(category.id),
      name: Value(category.name),
      createdAt: Value(category.createdAt),
    );
    return categoryModel;
  }

  Future<CategoryEntity> mapCategoryModel(CategoryModelData category) async {
    return CategoryEntity(
      id: category.id.toString(),
      name: category.name.toString(),
      createdAt: DateTime.parse(category.createdAt.toString()),
    );
  }
}
