import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../../.gen/core/repositories/token/models/login.freezed.dart';

@freezed
class LoginModel with _$LoginModel {
  const factory LoginModel.success() = _Success;
  const factory LoginModel.error({required String message}) = _Error;
}
