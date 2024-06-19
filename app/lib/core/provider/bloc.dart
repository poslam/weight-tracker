import 'package:riverpod/riverpod.dart';

import '../../core/provider/repository.dart';
import '../../features/login/bloc/bloc.dart';

final class ProviderBloc {
  static final loginForm = Provider<LoginFormBloc>(
    (ref) => LoginFormBloc(
      ref.watch(ProviderRepository.tokenRepository),
    ),
  );
}
