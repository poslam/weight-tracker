import 'package:drift/drift.dart';

class CategoryModel extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  DateTimeColumn get createdAt => dateTime()();
}
