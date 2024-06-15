import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/domain/usecases/img.dart';
import 'package:todo/i18n/strings.g.dart';
import 'package:todo/presentation/states/task/edit/bloc.dart';
import 'state.dart';

class ImgBloc extends Cubit<ImgState> {
  final ImgUseCase _imgkUseCase;
  final TaskEditBloc _taskBloc;

  ImgBloc(this._imgkUseCase, this._taskBloc) : super(const ImgState.input());

  Future<void> showImgs(String query, int page, int perPage) async {
    emit(const ImgState.loading());
    final List<String> data = await _imgkUseCase.getImgs(query, page, perPage);

    if (data.isEmpty) {
      emit(ImgState.error(msg: t.task.noImgs));
      return;
    }

    emit(ImgState.data(data: data));
  }

  Future<void> reset() async {
    emit(const ImgState.input());
  }

  Future<void> addImgs(String taskId, List<String> imgUrls) async {
    _imgkUseCase.addImgs(taskId, imgUrls);
    _taskBloc.refresh(taskId);
  }

  Future<void> removeImg(String taskId, String imgId) async {
    _imgkUseCase.removeImg(imgId);
    _taskBloc.refresh(taskId);
  }
}
