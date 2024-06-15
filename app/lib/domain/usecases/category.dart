import 'package:wtracker/data/mappers/category.dart';
import 'package:wtracker/domain/entities/category.dart';
import 'package:wtracker/domain/repository/category.dart';
import 'package:uuid/uuid.dart';

class CategoryUseCase {
  final CategoryRepository categoryRepository;
  final CategoryMapper categoryMapper;

  CategoryUseCase(
      {required this.categoryRepository, required this.categoryMapper});

  Future<List<CategoryEntity>> getCategories() async {
    List<CategoryEntity> categories = await categoryRepository.getCategories();

    categories.sort((a, b) => a.name.compareTo(b.name));
    return categories;
  }

  Future<bool> addCategory(String newCategoryName) async {
    if (await categoryRepository.categoryAlreadyExist(newCategoryName)) {
      return false;
    }

    CategoryEntity category = CategoryEntity(
      id: const Uuid().v8(),
      name: newCategoryName.trim(),
      createdAt: DateTime.now(),
    );

    await categoryRepository.addCategory(category);

    return true;
  }

  Future<bool> editCategory(
      String newCategoryName, String oldCategoryName) async {
    if (await categoryRepository.categoryAlreadyExist(newCategoryName)) {
      return false;
    }
    await categoryRepository.editCategory(newCategoryName, oldCategoryName);
    return true;
  }

  Future<void> removeCategory(String categoryId) async {
    await categoryRepository.removeCategory(categoryId);
  }

  Future<bool> isValidCategoryName(String name) async {
    return !(await categoryRepository.categoryAlreadyExist(name));
  }
}
