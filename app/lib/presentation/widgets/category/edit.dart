import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/core/provider/bloc.dart';
import 'package:todo/i18n/strings.g.dart';
import 'package:todo/presentation/states/category/edit/bloc.dart';
import 'package:todo/presentation/states/category/edit/state.dart';

class CategoryEditWidget extends ConsumerStatefulWidget {
  final dynamic categoryName;

  const CategoryEditWidget({super.key, required this.categoryName});

  @override
  ConsumerState<CategoryEditWidget> createState() => _CategoryEditWidgetState();
}

class _CategoryEditWidgetState extends ConsumerState<CategoryEditWidget> {
  late final GlobalKey<FormState> nameKey;
  late final TextEditingController nameController;

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    nameKey = GlobalKey<FormState>();
    nameController = TextEditingController(text: widget.categoryName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = ref.watch(categoryEditBlocProvider);

    return PopScope(
      onPopInvoked: (didPop) async {
        await Future.delayed(const Duration(milliseconds: 250));
        bloc.refresh();
      },
      child: BlocBuilder<CategoryEditBloc, CategoryEditState>(
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
                  ElevatedButton(
                    onPressed: () async {
                      if (!(nameKey.currentState?.validate() ?? false)) {
                        return;
                      }

                      if (await bloc.editCategory(
                              newCategoryName: nameController.text,
                              oldCategoryName: widget.categoryName) &&
                          context.mounted) {
                        Navigator.of(context).pop();
                      }
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
                ],
              ),
            );
          },
          updating: (_) => const Center(child: CircularProgressIndicator()),
          error: (error) => Padding(
            padding:
                const EdgeInsets.only(bottom: 18.0, left: 18.0, right: 18.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 50,
                  child: Center(child: Text(error.msg)),
                ),
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
                        t.common.confirm,
                        style: TextStyle(
                          color:
                              (Theme.of(context).brightness == Brightness.dark)
                                  ? Colors.black
                                  : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
