import 'package:drift/drift.dart';
import 'package:wtracker/data/models/category.dart';

class TaskModel extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  BoolColumn get isCompleted => boolean().withDefault(const Constant(false))();
  BoolColumn get isFavourite => boolean().withDefault(const Constant(false))();
  TextColumn get categoryId => text().references(CategoryModel, #id)();
}
