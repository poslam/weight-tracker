import 'package:shared_preferences/shared_preferences.dart';

class TokenStorage {
  final TokenBox token = TokenBox('token');

  final TokenBox refreshToken = TokenBox('refresh_token');
}

class TokenBox {
  final String _tokenKey;

  TokenBox(this._tokenKey);

  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  Future<void> deleteToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }
}
