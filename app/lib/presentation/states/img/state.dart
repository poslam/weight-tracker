import 'package:freezed_annotation/freezed_annotation.dart';
part 'state.freezed.dart';

@freezed
class ImgState with _$ImgState {
  const factory ImgState.input() = _Input;
  const factory ImgState.loading() = _Loading;
  const factory ImgState.data({
    required List<String> data,
  }) = _Data;
  const factory ImgState.error({required String msg}) = _Error;
}
