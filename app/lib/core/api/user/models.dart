// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../.gen/core/api/user/models.freezed.dart';
part '../../../.gen/core/api/user/models.g.dart';

@freezed
class UserViewResponse with _$UserViewResponse {
  const factory UserViewResponse({
    required String id,
    required String email,
    required String type,
    @JsonKey(name: "first_name") required String firstName,
    @JsonKey(name: "second_name") required String secondName,
    @JsonKey(name: "third_name") required String? thirdName,
  }) = _UserViewResponse;

  factory UserViewResponse.fromJson(Map<String, dynamic> json) =>
      _$UserViewResponseFromJson(json);
}
