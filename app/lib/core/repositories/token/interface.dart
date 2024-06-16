import 'models/login.dart';

abstract class TokenRepository {
  Future<void> refresh();

  Future<LoginModel> login(String email, String password);

  Future<void> logout();

  String? getToken();

  String? getQrToken();

  bool haveValidToken();
}
