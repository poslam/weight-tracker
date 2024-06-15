import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/core/navigation/bottomsheets.dart';
import 'package:todo/core/navigation/pages.dart';
import 'package:todo/core/provider/bloc.dart';
import 'package:todo/domain/entities/category.dart';
import 'package:todo/presentation/widgets/category/edit.dart';
import 'package:todo/presentation/widgets/delete_confirmation.dart';

class CategoryItemWidget extends ConsumerWidget {
  final CategoryEntity category;

  const CategoryItemWidget({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.watch(categoryListBlocProvider);
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Dismissible(
        key: Key(category.id),
        background: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onDismissed: (direction) => bloc.removeCategory(category.id),
        confirmDismiss: (direction) async {
          return showDialog(
            context: context,
            builder: (_) => ConfirmationDeleteDialog(
              delFunc: bloc.removeCategory,
              objId: category.id,
            ),
          );
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: GestureDetector(
            onTap: () => openTaskListPage(category, context),
            child: ListTile(
              title: Text(category.name),
              leading: const Icon(Icons.list),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () => openBottomSheet(
                      context,
                      CategoryEditWidget(
                        categoryName: category.name,
                      ),
                    ),
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
