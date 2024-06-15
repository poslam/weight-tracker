import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/core/navigation/bottomsheets.dart';
import 'package:todo/domain/entities/category.dart';
import 'package:todo/presentation/widgets/task/add.dart';
import 'package:todo/presentation/widgets/task/list.dart';
import 'package:todo/presentation/widgets/filter/set_filter.dart';

class TaskListPage extends ConsumerWidget {
  final CategoryEntity category;

  const TaskListPage({super.key, required this.category});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(category.name),
        forceMaterialTransparency: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => showDialog(
              context: context,
              builder: (context) => Filter(categoryId: category.id),
            ),
          ),
        ],
      ),
      body: TaskList(
        category: category,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            openBottomSheet(context, TaskAddWidget(category: category)),
        child: const Icon(Icons.add),
      ),
    );
  }
}
