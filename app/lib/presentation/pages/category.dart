import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wtracker/core/navigation/bottomsheets.dart';
import 'package:wtracker/i18n/strings.g.dart';
import 'package:wtracker/presentation/widgets/category/add.dart';
import 'package:wtracker/presentation/widgets/category/list.dart';

class CategoryListPage extends ConsumerWidget {
  const CategoryListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(t.category.categoryList),
      ),
      body: const CategoryList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => openBottomSheet(context, const CategoryAddWidget()),
        child: const Icon(Icons.add),
      ),
    );
  }
}
