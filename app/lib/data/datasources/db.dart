import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:todo/data/models/category.dart';
import 'package:todo/data/models/filter.dart';
import 'package:todo/data/models/img.dart';
import 'package:todo/data/models/task.dart';

part 'db.g.dart';

@DriftDatabase(tables: [
  CategoryModel,
  TaskModel,
  FilterModel,
  ImgModel,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}
