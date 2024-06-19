import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../.gen/features/login/bloc/state.freezed.dart';

@freezed
class LoginFormState with _$LoginFormState {
  const factory LoginFormState.waiting() = _Waiting;
  const factory LoginFormState.loading() = _Loading;
  const factory LoginFormState.error(String message) = _Error;
}
