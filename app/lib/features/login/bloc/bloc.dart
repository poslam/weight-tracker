import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/repositories/token/interface.dart';
import '../../../navigation/navigator.dart';
import '../../ui/snackbar.dart';
import 'state.dart';

class LoginFormBloc extends Cubit<LoginFormState> {
  final TokenRepository _tokenRepository;

  LoginFormBloc(this._tokenRepository) : super(const LoginFormState.waiting());

  Future<void> login(String email, String password) async {
    emit(const LoginFormState.loading());
    final model = await _tokenRepository.login(email, password);

    model.map(
      success: (_) {
        AppNavigator.openHomePage();
        emit(const LoginFormState.waiting());
      },
      error: (error) {
        CustomSnackBar.showSnackBar(error.message);
        emit(LoginFormState.error(error.message));
      },
    );
  }
}
