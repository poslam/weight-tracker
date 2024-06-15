import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wtracker/core/provider/datasources.dart';
import 'package:wtracker/core/provider/mappers.dart';
import 'package:wtracker/data/repository/category.dart';
import 'package:wtracker/data/repository/filter.dart';
import 'package:wtracker/data/repository/img.dart';
import 'package:wtracker/data/repository/task.dart';
import 'package:wtracker/domain/repository/category.dart';
import 'package:wtracker/domain/repository/filter.dart';
import 'package:wtracker/domain/repository/img.dart';
import 'package:wtracker/domain/repository/task.dart';

final filterRepositoryProvider = Provider<FilterRepository>(
  (ref) => FilterRepositoryData(
    db: ref.watch(dbProvider),
    filterMapper: ref.watch(filterMapperProvider),
  ),
);

final taskRepositoryProvider = Provider<TaskRepository>(
  (ref) => TaskRepositoryData(
    db: ref.watch(dbProvider),
    filterRepository: ref.watch(filterRepositoryProvider),
    taskMapper: ref.watch(taskMapperProvider),
  ),
);

final categoryRepositoryProvider = Provider<CategoryRepository>(
  (ref) => CategoryRepositoryData(
    db: ref.watch(dbProvider),
    categoryMapper: ref.watch(categoryMapperProvider),
  ),
);

final imgRepositoryProvider = Provider<ImgRepository>(
  (ref) => ImgRepositoryData(
    dio: Dio(),
    imgMapper: ref.watch(imgMapperProvider),
    db: ref.watch(dbProvider),
  ),
);
