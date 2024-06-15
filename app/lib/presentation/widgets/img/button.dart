import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/core/provider/bloc.dart';
import 'package:todo/domain/entities/task.dart';
import 'package:todo/i18n/strings.g.dart';
import 'package:todo/presentation/states/img/bloc.dart';
import 'package:todo/presentation/states/img/state.dart';

class ImgButton extends ConsumerWidget {
  final TextEditingController searchController;
  final TextEditingController perPageController;
  final TextEditingController pageController;

  final List<String> selectedImgs;
  final TaskEntity task;

  const ImgButton({
    super.key,
    required this.searchController,
    required this.perPageController,
    required this.pageController,
    required this.selectedImgs,
    required this.task,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.watch(imgBlocProvider);
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: BlocBuilder<ImgBloc, ImgState>(
        bloc: bloc,
        builder: (_, state) => ElevatedButton(
          onPressed: () {
            state.map(
              error: (_) {
                bloc.showImgs(
                  searchController.text,
                  int.parse(pageController.text),
                  int.parse(perPageController.text),
                );
                FocusScope.of(context).unfocus();
              },
              input: (_) {
                bloc.showImgs(
                  searchController.text,
                  int.parse(pageController.text),
                  int.parse(perPageController.text),
                );
                FocusScope.of(context).unfocus();
              },
              loading: (_) => {},
              data: (data) {
                bloc.addImgs(task.id, selectedImgs);
                Navigator.of(context).pop();
              },
            );
          },
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
                (Theme.of(context).brightness == Brightness.dark)
                    ? Colors.white
                    : Colors.black),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          child: state.map(
            error: (_) => SizedBox(
              width: double.infinity,
              child: Center(
                child: Text(
                  t.common.send,
                  style: TextStyle(
                    color: (Theme.of(context).brightness == Brightness.dark)
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
              ),
            ),
            input: (_) => SizedBox(
              width: double.infinity,
              child: Center(
                child: Text(
                  t.common.send,
                  style: TextStyle(
                    color: (Theme.of(context).brightness == Brightness.dark)
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
              ),
            ),
            loading: (_) => const Center(
              child: SizedBox(
                height: 18,
                width: 18,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.black,
                ),
              ),
            ),
            data: (_) => SizedBox(
              width: double.infinity,
              child: Center(
                child: Text(
                  t.common.add,
                  style: TextStyle(
                    color: (Theme.of(context).brightness == Brightness.dark)
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
