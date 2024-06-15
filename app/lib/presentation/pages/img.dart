import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wtracker/core/provider/bloc.dart';
import 'package:wtracker/domain/entities/task.dart';
import 'package:wtracker/presentation/widgets/img/button.dart';
import 'package:wtracker/presentation/widgets/img/gallery.dart';
import 'package:wtracker/presentation/widgets/img/text_field.dart';

class ImgWidget extends ConsumerStatefulWidget {
  final TaskEntity task;

  const ImgWidget({super.key, required this.task});

  @override
  ConsumerState<ImgWidget> createState() => _ImgWidgetState();
}

class _ImgWidgetState extends ConsumerState<ImgWidget> {
  late final GlobalKey<FormState> searchKey;
  late final GlobalKey<FormState> perPageKey;
  late final GlobalKey<FormState> pageKey;

  final TextEditingController searchController = TextEditingController();
  final TextEditingController perPageController =
      TextEditingController(text: "20");
  final TextEditingController pageController = TextEditingController(text: "1");

  final List<String> selectedImgs = [];

  @override
  void dispose() {
    searchController.dispose();
    perPageController.dispose();
    pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    searchKey = GlobalKey<FormState>();
    perPageKey = GlobalKey<FormState>();
    pageKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = ref.watch(imgBlocProvider);
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      child: PopScope(
        onPopInvoked: (_) {
          Future.delayed(
            const Duration(milliseconds: 300),
            () {
              bloc.reset();
            },
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(18.0) +
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ImgTextField(
                searchController: searchController,
                perPageController: perPageController,
                pageController: pageController,
                searchKey: searchKey,
                perPageKey: perPageKey,
                pageKey: pageKey,
              ),
              ImgGallery(
                perPageController: perPageController,
                selectedImgs: selectedImgs,
              ),
              ImgButton(
                searchController: searchController,
                perPageController: perPageController,
                pageController: pageController,
                task: widget.task,
                selectedImgs: selectedImgs,
              )
            ],
          ),
        ),
      ),
    );
  }
}
