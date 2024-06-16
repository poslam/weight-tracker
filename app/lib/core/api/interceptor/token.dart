import 'dart:async';

import 'package:chopper/chopper.dart';

import '../../repositories/token/interface.dart';

class TokenInterceptor implements RequestInterceptor {
  final TokenRepository _tokenRepository;

  TokenInterceptor(this._tokenRepository);

  @override
  FutureOr<Request> onRequest(Request request) async {
    String? token = _tokenRepository.getToken();

    if (token == null) {
      return request;
    }

    Request modifiedRequest = request.copyWith(
      headers: {
        'auth': token,
        ...request.headers,
      },
    );
    return modifiedRequest;
  }
}
