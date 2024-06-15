import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/data/mappers/category.dart';
import 'package:todo/data/mappers/filter.dart';
import 'package:todo/data/mappers/img.dart';
import 'package:todo/data/mappers/task.dart';

final categoryMapperProvider = Provider(
  (ref) => CategoryMapper(),
);

final taskMapperProvider = Provider(
  (ref) => TaskMapper(),
);

final filterMapperProvider = Provider(
  (ref) => FilterMapper(),
);

final imgMapperProvider = Provider(
  (ref) => ImgMapper(),
);