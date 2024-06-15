import 'package:wtracker/data/models/filter.dart';
import 'package:wtracker/domain/entities/filter.dart';

abstract class FilterRepository {
  Future<FilterEntity?> getFilter(String categoryId);

  Future<void> setFilter(FilterStatus status, String categoryId);
}
