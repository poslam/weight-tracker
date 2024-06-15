import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wtracker/core/provider/bloc.dart';
import 'package:wtracker/domain/entities/category.dart';
import 'package:wtracker/presentation/states/task/add/bloc.dart';
import 'package:wtracker/presentation/states/task/add/state.dart';
import 'package:wtracker/i18n/strings.g.dart';

class TaskAddWidget extends ConsumerStatefulWidget {
  final CategoryEntity category;

  const TaskAddWidget({super.key, required this.category});

  @override
  ConsumerState<TaskAddWidget> createState() => _CategoryAddWidgetState();
}

class _CategoryAddWidgetState extends ConsumerState<TaskAddWidget> {
  late final GlobalKey<FormState> nameKey;
  late final GlobalKey<FormState> descriptionKey;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    nameKey = GlobalKey<FormState>();
    descriptionKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = ref.watch(taskAddBlocProvider);

    return PopScope(
      onPopInvoked: (didPop) async {
        await Future.delayed(const Duration(milliseconds: 250));
        bloc.refresh();
      },
      child: BlocBuilder<TaskAddBloc, TaskAddState>(
        bloc: bloc,
        builder: (_, state) => state.map(
          input: (_) {
            return Padding(
              padding: const EdgeInsets.all(18.0) +
                  EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Form(
                    key: nameKey,
                    child: TextFormField(
                      minLines: 1,
                      maxLines: 1,
                      keyboardType: TextInputType.multiline,
                      autofocus: true,
                      enableInteractiveSelection: true,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        hintText: t.task.taskName,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black,
                              width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black,
                              width: 2),
                        ),
                        counterText: "",
                      ),
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return t.common.validInput;
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  TextFormField(
                    minLines: 4,
                    maxLines: 4,
                    keyboardType: TextInputType.multiline,
                    autofocus: true,
                    key: descriptionKey,
                    enableInteractiveSelection: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      hintText: t.task.taskDescription,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                            width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                            width: 2),
                      ),
                      counterText: "",
                    ),
                    controller: descriptionController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return t.common.validInput;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (!(nameKey.currentState?.validate() ?? false)) {
                        return;
                      }

                      if (await bloc.addTask(nameController.text,
                              descriptionController.text, widget.category.id) &&
                          context.mounted) {
                        Navigator.of(context).pop();
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        (Theme.of(context).brightness == Brightness.dark)
                            ? Colors.white
                            : Colors.black,
                      ),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          t.common.add,
                          style: TextStyle(
                            color: (Theme.of(context).brightness ==
                                    Brightness.dark)
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          updating: (_) => const Center(child: CircularProgressIndicator()),
          error: (error) => Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Expanded(child: Center(child: Text(error.msg))),
                ElevatedButton(
                  onPressed: bloc.refresh,
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
                  child: SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        t.common.add,
                        style: TextStyle(
                            color: (Theme.of(context).brightness ==
                                    Brightness.dark)
                                ? Colors.black
                                : Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
