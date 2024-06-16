import 'package:chopper/chopper.dart';

import '../repositories/token/interface.dart';
import 'auth/service.dart';
import 'interceptor/token.dart';
import 'user/service.dart';
import 'weight/service.dart';

final class Api extends ChopperClient {
  Api({
    required String baseUrl,
    required TokenRepository tokenRepository,
  }) : super(
          baseUrl: Uri.parse(baseUrl),
          services: [
            UserService.create(),
            WeightService.create(),
          ],
          converter: const JsonConverter(),
          interceptors: [
            TokenInterceptor(tokenRepository),
          ],
        );
}

final class SessionApi extends ChopperClient {
  SessionApi({
    required String baseUrl,
  }) : super(
          baseUrl: Uri.parse(baseUrl),
          services: [
            AuthService.create(),
          ],
          converter: const JsonConverter(),
        );
}
