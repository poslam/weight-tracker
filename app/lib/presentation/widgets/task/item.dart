import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wtracker/core/navigation/pages.dart';
import 'package:wtracker/core/provider/bloc.dart';
import 'package:wtracker/domain/entities/task.dart';
import 'package:wtracker/presentation/widgets/delete_confirmation.dart';

class TaskItemWidget extends ConsumerWidget {
  final TaskEntity task;

  const TaskItemWidget({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.watch(taskListBlocProvider);
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Dismissible(
        key: Key(task.id),
        background: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onDismissed: (direction) => bloc.removeTask(task.id),
        confirmDismiss: (direction) async {
          return showDialog(
            context: context,
            builder: (_) => ConfirmationDeleteDialog(
                delFunc: bloc.removeTask, objId: task.id),
          );
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: GestureDetector(
            onTap: () => openTaskPage(context, task),
            child: ListTile(
              title: Text(
                task.name,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: task.description == ""
                  ? null
                  : Text(
                      task.description,
                      overflow: TextOverflow.ellipsis,
                    ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: task.isFavourite
                        ? const Icon(Icons.star)
                        : const Icon(Icons.star_border),
                    onPressed: () {
                      task.isFavourite
                          ? bloc.favourTask(task.id, false)
                          : bloc.favourTask(task.id, true);
                      bloc.refresh(task.categoryId);
                    },
                  ),
                  IconButton(
                    icon: task.isCompleted
                        ? const Icon(Icons.circle)
                        : const Icon(Icons.circle_outlined),
                    onPressed: () {
                      task.isCompleted
                          ? bloc.completeTask(task.id, false)
                          : bloc.completeTask(task.id, true);
                      bloc.refresh(task.categoryId);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
