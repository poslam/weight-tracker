import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wtracker/core/provider/mappers.dart';
import 'package:wtracker/core/provider/repository.dart';
import 'package:wtracker/domain/usecases/img.dart';
import 'package:wtracker/domain/usecases/category.dart';
import 'package:wtracker/domain/usecases/filter.dart';
import 'package:wtracker/domain/usecases/task.dart';

final categoryUseCaseProvider = Provider(
  (ref) => CategoryUseCase(
    categoryRepository: ref.watch(categoryRepositoryProvider),
    categoryMapper: ref.watch(categoryMapperProvider),
  ),
);

final filterUseCaseProvider = Provider(
  (ref) => FilterUseCase(
    filterRepository: ref.watch(filterRepositoryProvider),
  ),
);

final taskUseCaseProvider = Provider(
  (ref) => TaskUseCase(
    taskRepository: ref.watch(taskRepositoryProvider),
    taskMapper: ref.watch(taskMapperProvider),
    filterUseCase: ref.watch(filterUseCaseProvider),
    imgUseCase: ref.watch(imgUseCaseProvider),
  ),
);

final imgUseCaseProvider = Provider(
  (ref) => ImgUseCase(
    imgMapper: ref.watch(imgMapperProvider),
    imgRepository: ref.watch(imgRepositoryProvider),
  ),
);
