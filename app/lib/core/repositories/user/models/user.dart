import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../api/user/models.dart';

part '../../../../.gen/core/repositories/user/models/user.freezed.dart';

@freezed
class UserDataModel with _$UserDataModel {
  const factory UserDataModel.data({
    required String id,
    required String email,
    required String firstName,
    required String secondName,
    required String? thirdName,
    required String type,
  }) = _Success;

  const factory UserDataModel.error({
    required String message,
  }) = _Error;

  factory UserDataModel.fromRespons(UserViewResponse response) =>
      UserDataModel.data(
        id: response.id,
        firstName: response.firstName,
        secondName: response.secondName,
        thirdName: response.thirdName ?? "",
        email: response.email,
        type: response.type,
      );
}
