import 'package:drift/drift.dart';
import 'package:wtracker/data/datasources/db.dart';
import 'package:wtracker/data/mappers/category.dart';
import 'package:wtracker/domain/entities/category.dart';
import 'package:wtracker/domain/repository/category.dart';

class CategoryRepositoryData implements CategoryRepository {
  final AppDatabase db;
  final CategoryMapper categoryMapper;

  CategoryRepositoryData({required this.db, required this.categoryMapper});

  @override
  Future<List<CategoryEntity>> getCategories() async {
    final categoryData = await db.select(db.categoryModel).get();

    final query = await Future.wait((categoryData)
        .map((category) => categoryMapper.mapCategoryModel(category))
        .toList());

    return query;
  }

  @override
  Future<void> addCategory(CategoryEntity category) async {
    db
        .into(db.categoryModel)
        .insert(await categoryMapper.mapCategoryEntity(category));
  }

  @override
  Future<void> editCategory(
      String newCategoryName, String oldCategoryName) async {
    db.update(db.categoryModel)
      ..where((category) => category.name.equals(oldCategoryName))
      ..write(CategoryModelCompanion(name: Value(newCategoryName.trim())));
  }

  @override
  Future<void> removeCategory(String categoryId) async {
    (db.delete(db.categoryModel)
          ..where((category) => category.id.equals(categoryId)))
        .go();
    (db.delete(db.taskModel)
          ..where((task) => task.categoryId.equals(categoryId)))
        .go();
    (db.delete(db.filterModel)
          ..where((filter) => filter.categoryId.equals(categoryId)))
        .go();
  }

  @override
  Future<bool> categoryAlreadyExist(String categoryName) async {
    final category = db.select(db.categoryModel)
      ..where((category) => category.name.equals(categoryName));

    return await category.get().then((value) => value.isNotEmpty);
  }
}
