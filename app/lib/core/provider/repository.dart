import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/core/provider/datasources.dart';
import 'package:todo/core/provider/mappers.dart';
import 'package:todo/data/repository/category.dart';
import 'package:todo/data/repository/filter.dart';
import 'package:todo/data/repository/img.dart';
import 'package:todo/data/repository/task.dart';
import 'package:todo/domain/repository/category.dart';
import 'package:todo/domain/repository/filter.dart';
import 'package:todo/domain/repository/img.dart';
import 'package:todo/domain/repository/task.dart';

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
