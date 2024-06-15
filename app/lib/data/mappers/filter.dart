import 'package:drift/drift.dart';
import 'package:todo/data/datasources/db.dart';
import 'package:todo/data/models/filter.dart';
import 'package:todo/domain/entities/filter.dart';

class FilterMapper {
  FilterStatus mapToDart(int fromDb) {
    return FilterStatus.values[fromDb];
  }

  int mapToSql(FilterStatus value) {
    return value.index;
  }

  Future<FilterModelCompanion> mapFilterEntity(FilterEntity filter) async {
    FilterModelCompanion taskModel = FilterModelCompanion(
      name: Value(mapToSql(filter.name)),
      categoryId: Value(filter.categoryId),
    );

    return taskModel;
  }

  Future<FilterEntity?> mapFilterModel(FilterModelData? filter) async {
    if (filter == null) {
      return null;
    }

    return FilterEntity(
        name: mapToDart(filter.name), categoryId: filter.categoryId.toString());
  }
}
