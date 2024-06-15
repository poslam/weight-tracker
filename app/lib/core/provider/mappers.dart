import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wtracker/data/mappers/category.dart';
import 'package:wtracker/data/mappers/filter.dart';
import 'package:wtracker/data/mappers/img.dart';
import 'package:wtracker/data/mappers/task.dart';

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
