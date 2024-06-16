import 'dart:convert';

import 'package:chopper/chopper.dart';

import 'models.dart';

part '../../../.gen/core/api/user/service.chopper.dart';

@ChopperApi()
abstract class UserService extends ChopperService {
  Future<UserViewResponse> view() async {
    final response = await _view();

    if (response.statusCode != 200) {
      final error = jsonDecode(response.error as String);
      throw Exception(error['detail']);
    }

    return UserViewResponse.fromJson(response.body);
  }

  @Post(path: '/user/view')
  Future<Response> _view();

  static UserService create([ChopperClient? client]) => _$UserService(client);
}
