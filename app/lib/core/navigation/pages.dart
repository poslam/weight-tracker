import 'package:flutter/material.dart';
import 'package:todo/domain/entities/category.dart';
import 'package:todo/domain/entities/task.dart';
import 'package:todo/presentation/pages/task.dart';
import 'package:todo/presentation/pages/tasks.dart';

void openTaskListPage(CategoryEntity category, BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (_) => TaskListPage(category: category),
    ),
  );
}

void openTaskPage(BuildContext context, TaskEntity task) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (_) => TaskPage(task: task),
    ),
  );
}
