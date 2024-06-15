import 'package:freezed_annotation/freezed_annotation.dart';
part 'img.freezed.dart';

@freezed
class ImgEntity with _$ImgEntity {
  const factory ImgEntity({
    required String id,
    required String url,
    required String taskId,
  }) = _ImgEntity;
}
