import 'package:riverpod/riverpod.dart';

import '../repositories/token/interface.dart';
import '../repositories/token/repository.dart';
import '../repositories/user/interface.dart';
import '../repositories/user/repository.dart';
import 'api.dart';
import 'storage.dart';

final class ProviderRepository {
  ProviderRepository._();

  static final tokenRepository = Provider<TokenRepository>(
    (ref) => TokenRepositoryImpl(
      ref.watch(ProviderApi.token),
      ref.watch(ProviderApi.login),
      ref.watch(ProviderStorage.token),
    ),
  );

  static final userRepository = Provider<UserRepository>(
    (ref) => UserRepositoryImpl(
      ref.watch(ProviderApi.user),
    ),
  );
}
