import 'package:todo/data/models/filter.dart';
import 'package:todo/domain/entities/filter.dart';

abstract class FilterRepository {
  Future<FilterEntity?> getFilter(String categoryId);

  Future<void> setFilter(FilterStatus status, String categoryId);
}
