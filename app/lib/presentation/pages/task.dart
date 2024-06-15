import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/core/provider/bloc.dart';
import 'package:todo/domain/entities/task.dart';
import 'package:todo/i18n/strings.g.dart';
import 'package:todo/presentation/states/task/edit/bloc.dart';
import 'package:todo/presentation/states/task/edit/state.dart';
import 'package:todo/presentation/widgets/task/edit.dart';

class TaskPage extends ConsumerWidget {
  final TaskEntity task;

  const TaskPage({super.key, required this.task});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.watch(taskEditBlocProvider);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(t.task.task),
        forceMaterialTransparency: true,
      ),
      body: BlocBuilder<TaskEditBloc, TaskEditState>(
        bloc: bloc,
        builder: (_, state) => state.map(
          init: (_) => TaskEditWidget(task: task),
          input: (data) => TaskEditWidget(task: data.data),
          error: (msg) => Center(
            child: Text(msg.msg),
          ),
        ),
      ),
    );
  }
}