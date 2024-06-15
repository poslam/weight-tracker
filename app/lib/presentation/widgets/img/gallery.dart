import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/core/provider/bloc.dart';
import 'package:todo/presentation/states/img/bloc.dart';
import 'package:todo/presentation/states/img/state.dart';
import 'package:todo/presentation/widgets/img/img.dart';

class ImgGallery extends ConsumerWidget {
  final TextEditingController perPageController;
  final List<String> selectedImgs;

  const ImgGallery({
    super.key,
    required this.perPageController,
    required this.selectedImgs,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.watch(imgBlocProvider);
    return BlocBuilder<ImgBloc, ImgState>(
      bloc: bloc,
      builder: (_, state) => state.map(
        error: (error) => SizedBox(
          height: 30,
          width: double.infinity,
          child: Center(child: Text(error.msg)),
        ),
        input: (_) => const SizedBox.shrink(),
        loading: (_) => const SizedBox.shrink(),
        data: (data) => ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: SizedBox(
            height: 400,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: int.parse(perPageController.text),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) => ImgItem(
                photos: data.data,
                index: index,
                selectedImgs: selectedImgs,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
