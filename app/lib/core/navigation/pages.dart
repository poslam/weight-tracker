import 'package:flutter/material.dart';
import 'package:wtracker/domain/entities/category.dart';
import 'package:wtracker/domain/entities/task.dart';
import 'package:wtracker/presentation/pages/task.dart';
import 'package:wtracker/presentation/pages/tasks.dart';

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
