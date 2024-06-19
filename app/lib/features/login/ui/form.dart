import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../.gen/i18n/strings.g.dart';

import '../../../core/provider/bloc.dart';
import '../../ui/button.dart';
import '../../ui/textfield.dart';
import '../bloc/bloc.dart';
import '../bloc/state.dart';

final _formKey = GlobalKey<FormState>();

class LoginForm extends ConsumerWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  LoginForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.watch(ProviderBloc.loginForm);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextField(
            hint: t.signin.emailOrPhone,
            controller: emailController,
            autofillHints: const [AutofillHints.email],
            textInputAction: TextInputAction.next,
            validator: _emailValidator,
            formatters: [
              FilteringTextInputFormatter.deny(' '),
            ],
          ),
          CustomTextField(
            hint: t.signin.password,
            controller: passwordController,
            autofillHints: const [AutofillHints.password],
            textInputAction: TextInputAction.done,
            canObscure: true,
            validator: _passwordValidator,
            formatters: [
              FilteringTextInputFormatter.deny(' '),
            ],
          ),
          const SizedBox(height: 32),
          BlocBuilder<LoginFormBloc, LoginFormState>(
            bloc: bloc,
            builder: (_, state) => CustomButton(
              text: t.signin.login,
              onTap: () {
                if (!_formKey.currentState!.validate()) {
                  return;
                }
                bloc.login(emailController.text, passwordController.text);
              },
              isLoading: state.maybeMap(
                loading: (_) => true,
                orElse: () => false,
              ),
            ),
          )
        ],
      ),
    );
  }

  String? _emailValidator(String? text) {
    if (text == null || text.isEmpty) {
      return t.signin.emailOrPhoneRequired;
    }

    if (!EmailValidator.validate(text)) {
      return t.signin.invalidEmail;
    }

    if (!EmailValidator.validate(text) &&
        !RegExp(r'^(?:\+?7|8)[0-9]{10}$').hasMatch(text)) {
      return t.signin.invalidPhone;
    }

    return null;
  }

  String? _passwordValidator(String? text) {
    if (text == null || text.isEmpty) {
      return t.signin.passwordRequired;
    }
    return null;
  }
}
