import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/core/navigation/bottomsheets.dart';
import 'package:todo/core/provider/bloc.dart';
import 'package:todo/domain/entities/task.dart';
import 'package:intl/intl.dart';
import 'package:todo/i18n/strings.g.dart';
import 'package:todo/presentation/pages/img.dart';

class TaskEditWidget extends ConsumerStatefulWidget {
  final TaskEntity task;

  const TaskEditWidget({super.key, required this.task});

  @override
  ConsumerState<TaskEditWidget> createState() => _TaskEditWidgetState();
}

class _TaskEditWidgetState extends ConsumerState<TaskEditWidget> {
  late final GlobalKey<FormState> _nameKey;
  late final GlobalKey<FormState> _descriptionKey;

  late final TextEditingController _nameController;
  late final TextEditingController _descriptionController;

  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _nameKey = GlobalKey<FormState>();
    _descriptionKey = GlobalKey<FormState>();

    _nameController = TextEditingController(text: widget.task.name);
    _descriptionController =
        TextEditingController(text: widget.task.description);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = ref.watch(taskEditBlocProvider);
    final imgBloc = ref.watch(imgBlocProvider);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        _scrollController.animateTo(
          0.0,
          curve: Curves.ease,
          duration: const Duration(milliseconds: 300),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(18.0) +
            EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
        child: ListView(
          controller: _scrollController,
          children: [
            Builder(
              builder: (context) {
                if (widget.task.imgUrls.isEmpty) {
                  return CarouselSlider(
                    options: CarouselOptions(
                      height: 200.0,
                      enableInfiniteScroll: false,
                      enlargeCenterPage: true,
                    ),
                    items: [
                      Stack(
                        children: [
                          SizedBox(
                            height: 400,
                            width: 400,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: const Icon(Icons.image),
                            ),
                          ),
                          Positioned(
                            right: 3,
                            bottom: 10,
                            child: IconButton(
                                onPressed: () => openBottomSheet(
                                      context,
                                      ImgWidget(task: widget.task),
                                    ),
                                style: ButtonStyle(
                                  backgroundColor: WidgetStateProperty.all(
                                      Colors.black.withOpacity(0.9)),
                                  shape: WidgetStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  foregroundColor:
                                      WidgetStateProperty.all(Colors.green),
                                ),
                                icon: const Icon(Icons.add)),
                          ),
                        ],
                      )
                    ],
                  );
                }
                return CarouselSlider(
                  options: CarouselOptions(
                    height: 200.0,
                    enableInfiniteScroll: false,
                    enlargeCenterPage: true,
                  ),
                  items: widget.task.imgUrls
                      .map(
                        (img) => Builder(
                          builder: (context) {
                            return Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.network(
                                      img.url,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 3,
                                  bottom: 10,
                                  child: IconButton(
                                      onPressed: () => openBottomSheet(
                                            context,
                                            ImgWidget(task: widget.task),
                                          ),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            WidgetStateProperty.all(
                                                Colors.black.withOpacity(0.9)),
                                        shape: WidgetStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                        ),
                                        foregroundColor:
                                            WidgetStateProperty.all(
                                                Colors.green),
                                      ),
                                      icon: const Icon(Icons.add)),
                                ),
                                Positioned(
                                  left: 3,
                                  bottom: 10,
                                  child: IconButton(
                                      onPressed: () => imgBloc.removeImg(
                                          widget.task.id, img.id),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            WidgetStateProperty.all(
                                                Colors.black.withOpacity(0.9)),
                                        shape: WidgetStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                        ),
                                        foregroundColor:
                                            WidgetStateProperty.all(Colors.red),
                                      ),
                                      icon: const Icon(Icons.delete)),
                                ),
                              ],
                            );
                          },
                        ),
                      )
                      .toList(),
                );
              },
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              t.task.taskName,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 14,
            ),
            Form(
              key: _nameKey,
              child: TextFormField(
                minLines: 1,
                maxLines: 1,
                keyboardType: TextInputType.multiline,
                enableInteractiveSelection: true,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    hintText: t.task.taskName,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                          width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                          width: 2),
                    ),
                    counterText: ""),
                controller: _nameController,
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
            Text(
              t.task.taskDescription,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 14,
            ),
            TextFormField(
              minLines: 9,
              maxLines: 100,
              keyboardType: TextInputType.multiline,
              key: _descriptionKey,
              enableInteractiveSelection: true,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  hintText: t.task.taskDescription,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                        width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                        width: 2),
                  ),
                  counterText: ""),
              controller: _descriptionController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return t.common.validInput;
                }
                return null;
              },
            ),
            const SizedBox(
              height: 7,
            ),
            Text(
              '${t.task.createdAt}: ${DateFormat('hh:mm dd.MM.yyyy').format(widget.task.createdAt)}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            ElevatedButton(
              onPressed: () {
                if (!(_nameKey.currentState?.validate() ?? false)) {
                  return;
                }

                bloc.editTask(widget.task.id, _nameController.text,
                    _descriptionController.text);

                Navigator.of(context).pop();
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
                    t.task.confirm,
                    style: TextStyle(
                        color: (Theme.of(context).brightness == Brightness.dark)
                            ? Colors.black
                            : Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
