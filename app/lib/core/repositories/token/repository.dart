import '../../../.gen/i18n/strings.g.dart';
import '../../api/auth/models.dart';
import '../../api/auth/service.dart';
import '../../storage/token.dart';
import 'interface.dart';
import 'models/login.dart';

class TokenRepositoryImpl extends TokenRepository {
  final AuthService _authService;
  final TokenStorage _tokenStorage;

  String? _token;
  String? _refreshToken;
  String? _qrToken;

  bool haveSuccessRefresh = false;
  bool triedToRestoreToken = false;

  TokenRepositoryImpl(
    this._authService,
    this._tokenStorage,
  );

  @override
  String? getToken() => _token;

  @override
  String? getQrToken() => _qrToken;

  @override
  bool haveValidToken() => _token != null;

  @override
  Future<LoginModel> login(String email, String password) async {
    try {
      LoginResponse response = await _authService.login(email, password);

      _token = response.token;
      _refreshToken = response.refreshToken;

      haveSuccessRefresh = true;

      _updateTokenStorage();

      return const LoginModel.success();
    } catch (e) {
      final error = e.toString().substring(11);
      final errorMessage = switch (error) {
        "user not found" => t.errors.userNotFound,
        "wrong auth data" => t.errors.wrongAuthData,
        "user is banned" => t.errors.userBanned,
        String() => t.errors.unknownError,
      };

      return LoginModel.error(message: errorMessage);
    }
  }

  @override
  Future<void> logout() async {
    _token = null;
    _refreshToken = null;
    _qrToken = null;
    _deleteToken();
  }

  @override
  Future<void> refresh() async {
    if (haveSuccessRefresh) {
      return;
    }

    if (!triedToRestoreToken) {
      await _restoreToken();
      triedToRestoreToken = true;
    }

    if (_refreshToken == null) {
      _token = null;
      _qrToken = null;
      return;
    }

    try {
      final response = await _authService.refresh(_refreshToken!);

      _token = response.token;
      _refreshToken = response.refreshToken;

      haveSuccessRefresh = true;

      _updateTokenStorage();
    } catch (e) {
      _token = null;
      _refreshToken = null;
      _qrToken = null;
    }
  }

  void _updateTokenStorage() {
    if (_token != null) {
      _tokenStorage.token.saveToken(_token!);
    }
    if (_refreshToken != null) {
      _tokenStorage.refreshToken.saveToken(_refreshToken!);
    }
  }

  Future<void> _restoreToken() async {
    _token = await _tokenStorage.token.getToken();
    _refreshToken = await _tokenStorage.refreshToken.getToken();
  }

  void _deleteToken() {
    _tokenStorage.token.deleteToken();
    _tokenStorage.refreshToken.deleteToken();
  }
}
