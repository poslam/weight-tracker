import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wtracker/core/provider/bloc.dart';
import 'package:wtracker/data/models/filter.dart';
import 'package:wtracker/domain/entities/filter.dart';
import 'package:wtracker/i18n/strings.g.dart';
import 'package:wtracker/presentation/states/filter/bloc.dart';
import 'package:wtracker/presentation/states/filter/state.dart';

class Filter extends ConsumerWidget {
  final String categoryId;

  const Filter({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.watch(filterListBlocProvider);
    bloc.refresh(categoryId);

    return BlocBuilder<FilterListBloc, FilterListState>(
      bloc: bloc,
      builder: (_, state) {
        return state.map(
          loading: (_) {
            bloc.refresh(categoryId);
            return const Center(child: CircularProgressIndicator());
          },
          data: (data) => AlertDialog(
            title: Text(
              t.task.setFilter,
              style: const TextStyle(fontSize: 20),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: filtersMap.entries.map(
                (entry) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      bloc.setFilter(categoryId, entry.key);
                      bloc.refresh(categoryId);
                    },
                    child: ListTile(
                      title: Text(entry.value),
                      leading: Radio<FilterStatus>(
                        value: entry.key,
                        groupValue: data.data,
                        fillColor: WidgetStateProperty.all(Colors.white),
                        visualDensity: const VisualDensity(
                            horizontal: VisualDensity.minimumDensity,
                            vertical: VisualDensity.minimumDensity),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        onChanged: (value) {
                          Navigator.of(context).pop();
                          bloc.setFilter(categoryId, value!);
                        },
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
          ),
          error: (error) => Center(child: Text(error.msg)),
        );
      },
    );
  }
}
