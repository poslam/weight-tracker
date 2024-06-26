import 'package:riverpod/riverpod.dart';

import '../api/auth/service.dart';
import '../api/chopper.dart';
import '../api/user/service.dart';

final class ProviderApi {
  static final api = Provider<Api>(
    (_) => throw UnimplementedError(),
  );

  static final sessionApi = Provider<SessionApi>(
    (_) => throw UnimplementedError(),
  );

  static final auth = Provider<AuthService>(
    (ref) => ref.watch(ProviderApi.sessionApi).getService<AuthService>(),
  );

  static final user = Provider<UserService>(
    (ref) => ref.watch(ProviderApi.sessionApi).getService<UserService>(),
  );
}
