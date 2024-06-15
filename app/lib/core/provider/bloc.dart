import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wtracker/core/provider/usecases.dart';
import 'package:wtracker/presentation/states/category/add/bloc.dart';
import 'package:wtracker/presentation/states/category/edit/bloc.dart';
import 'package:wtracker/presentation/states/category/list/bloc.dart';
import 'package:wtracker/presentation/states/filter/bloc.dart';
import 'package:wtracker/presentation/states/task/add/bloc.dart';
import 'package:wtracker/presentation/states/task/edit/bloc.dart';
import 'package:wtracker/presentation/states/img/bloc.dart';
import 'package:wtracker/presentation/states/task/list/bloc.dart';

final categoryListBlocProvider = Provider(
  (ref) => CategoryListBloc(
    ref.watch(categoryUseCaseProvider),
  ),
);

final categoryAddBlocProvider = Provider(
  (ref) => CategoryAddBloc(
    ref.watch(categoryUseCaseProvider),
    ref.watch(categoryListBlocProvider),
  ),
);

final categoryEditBlocProvider = Provider(
  (ref) => CategoryEditBloc(
    ref.watch(categoryUseCaseProvider),
    ref.watch(categoryListBlocProvider),
  ),
);

final taskListBlocProvider = Provider(
  (ref) => TaskListBloc(
    ref.watch(taskUseCaseProvider),
  ),
);

final taskAddBlocProvider = Provider(
  (ref) => TaskAddBloc(
    ref.watch(taskUseCaseProvider),
    ref.watch(taskListBlocProvider),
  ),
);

final taskEditBlocProvider = Provider(
  (ref) => TaskEditBloc(
    ref.watch(taskUseCaseProvider),
    ref.watch(taskListBlocProvider),
  ),
);

final filterListBlocProvider = Provider(
  (ref) => FilterListBloc(
      ref.watch(filterUseCaseProvider), ref.watch(taskListBlocProvider)),
);

final imgBlocProvider = Provider(
  (ref) => ImgBloc(
    ref.watch(imgUseCaseProvider),
    ref.watch(taskEditBlocProvider),
  ),
);
