import 'dart:convert';

import 'package:chopper/chopper.dart';

import 'models.dart';

part '../../../.gen/core/api/auth/service.chopper.dart';

@ChopperApi()
abstract class AuthService extends ChopperService {
  Future<LoginResponse> login(String email, String password) async {
    final response = await _login(email, password);

    if (response.statusCode != 200) {
      final error = jsonDecode(response.error as String);
      throw Exception(error['detail']);
    }

    return LoginResponse.fromJson(response.body);
  }

  Future<TokenResponse> refresh(String refreshToken) async {
    final response = await _refresh(refreshToken);

    if (!response.isSuccessful) {
      throw Exception(response.error);
    }

    return TokenResponse.fromJson(response.body);
  }

  @Post(path: '/auth/login')
  Future<Response> _login(
    @Field("email") String email,
    @Field("password") String password,
  );

  @Post(path: '/auth/refresh')
  Future<Response> _refresh(
    @Header("token") String refreshToken,
  );

  static AuthService create([ChopperClient? client]) => _$AuthService(client);
}
