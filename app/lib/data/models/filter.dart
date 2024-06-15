import 'package:drift/drift.dart';
import 'package:todo/data/models/category.dart';

enum FilterStatus { all, completed, uncompleted, favourite }

class FilterModel extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get categoryId => text().references(CategoryModel, #id)();
  IntColumn get name => integer()();
}
