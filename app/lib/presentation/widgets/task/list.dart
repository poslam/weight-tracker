import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo/core/provider/bloc.dart';
import 'package:todo/domain/entities/category.dart';
import 'package:todo/i18n/strings.g.dart';
import 'package:todo/presentation/states/task/list/bloc.dart';
import 'package:todo/presentation/states/task/list/state.dart';
import 'package:todo/presentation/widgets/task/item.dart';

class TaskList extends HookConsumerWidget {
  final CategoryEntity category;

  const TaskList({super.key, required this.category});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.watch(taskListBlocProvider);

    useEffect(() {
      bloc.refresh(category.id);
      return null;
    });

    return BlocBuilder<TaskListBloc, TaskListState>(
      bloc: bloc,
      builder: (_, state) {
        return state.map(
          loading: (_) {
            bloc.refresh(category.id);
            return const Center(child: CircularProgressIndicator());
          },
          data: (data) => RefreshIndicator(
            onRefresh: () => bloc.refresh(category.id),
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (data.data.isEmpty) {
                  return ListView(
                    children: [
                      SizedBox(
                        height: constraints.maxHeight - 20,
                        child: Center(
                          child: Text(t.task.noTasks),
                        ),
                      ),
                    ],
                  );
                }
                return ListView(
                  children: data.data
                      .map((task) => TaskItemWidget(task: task))
                      .toList(),
                );
              },
            ),
          ),
          error: (error) => Center(child: Text(error.msg)),
        );
      },
    );
  }
}
