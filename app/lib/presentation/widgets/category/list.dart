import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wtracker/core/provider/bloc.dart';
import 'package:wtracker/i18n/strings.g.dart';
import 'package:wtracker/presentation/states/category/list/bloc.dart';
import 'package:wtracker/presentation/states/category/list/state.dart';
import 'package:wtracker/presentation/widgets/category/item.dart';

class CategoryList extends ConsumerWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.watch(categoryListBlocProvider);
    return BlocBuilder<CategoryListBloc, CategoryListState>(
      bloc: bloc,
      builder: (_, state) {
        return state.map(
          loading: (_) {
            bloc.refresh();
            return const Center(child: CircularProgressIndicator());
          },
          data: (data) => RefreshIndicator(
            onRefresh: bloc.refresh,
            child: Builder(
              builder: (context) {
                if (data.data.isEmpty) {
                  return Center(
                    child: Text(t.category.noCategory),
                  );
                }
                return ListView(
                  children: data.data
                      .map((category) => CategoryItemWidget(category: category))
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
