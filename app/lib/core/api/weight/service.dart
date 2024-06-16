import 'dart:convert';

import 'package:chopper/chopper.dart';

import 'models.dart';

part '../../../.gen/core/api/weight/service.chopper.dart';

@ChopperApi()
abstract class WeightService extends ChopperService {
  Future<bool> add(double weight) async {
    final response = await _add(weight);

    if (response.statusCode != 200) {
      final error = jsonDecode(response.error as String);
      throw Exception(error['detail']);
    }

    return true;
  }

  Future<WeightResponse> view(String refreshToken) async {
    final response = await _view(refreshToken);

    if (!response.isSuccessful) {
      throw Exception(response.error);
    }

    return WeightResponse.fromJson(response.body);
  }

  @Post(path: '/weight/add')
  Future<Response> _add(
    @Query("weight") double weight,
  );

  @Post(path: '/weight/view')
  Future<Response> _view(
    @Header("token") String refreshToken,
  );

  static WeightService create([ChopperClient? client]) =>
      _$WeightService(client);
}
