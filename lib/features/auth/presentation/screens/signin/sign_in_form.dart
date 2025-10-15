import 'package:business_code/configurations/navigation/navigator_provider/navigator_provider.dart';
import 'package:business_code/configurations/ui/theme/theme_data.dart';
import 'package:business_code/core/validators/email.dart';
import 'package:business_code/core/validators/password.dart';
import 'package:business_code/features/auth/presentation/screens/signin/bloc/sign_in_bloc.dart';
import 'package:business_code/features/auth/presentation/screens/signin/submit_button.dart';
import 'package:business_code/features/auth/presentation/screens/signup/signup_screen.dart';
import 'package:business_code/generated/l10n.dart';
import 'package:business_code/shared/ui/widgets/buttons/button.dart';
import 'package:business_code/shared/ui/widgets/overlays/overlays.dart';
import 'package:business_code/shared/ui/widgets/text.dart';
import 'package:business_code/shared/ui/widgets/text_inputs/text_input.dart';
import 'package:business_code/shell/app_shell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  void _navigateToShell(BuildContext context) {
    const screen = AppShell();
    NavigatorProvider.of(context).pushAndRemoveAll(context, screen);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status.isSuccess) {
          _navigateToShell(context);
        } else if (state.status.isFailure) {
          showErrorTopOverlay(context, message: "Sign in failed");
        }
      },
      child: Align(
        alignment: const Alignment(0, -3 / 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            UiText.largeMedium(S.of(context).login),
            const SizedBox(height: 12),
            _EmailInput(),
            const SizedBox(height: 12),
            _PasswordInput(),
            const _ForgotPasswordButton(),
            const SizedBox(height: 16),
            SubmitButton(),
            const SizedBox(height: 36),
            const _SignUpLink(),
          ],
        ),
      ),
    );
  }
}

class _SignUpLink extends StatelessWidget {
  const _SignUpLink();

  void _navigateToSignUpScreen(BuildContext context) {
    const screen = SignUpScreen();
    NavigatorProvider.of(context).push(context, screen);
  }

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).colorPalette;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 4,
      children: [
        UiText.smallRegular(
          S.of(context).dontHaveAnAccount,
          color: palette.dark05,
        ),
        GestureDetector(
          onTap: () => _navigateToSignUpScreen(context),
          child: UiText.smallMedium(S.of(context).signUp, color: palette.blue),
        ),
      ],
    );
  }
}

class _ForgotPasswordButton extends StatelessWidget {
  const _ForgotPasswordButton();

  void _navigateToForgotPasswordScreen(BuildContext context) {
    // navigate to forgot password
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: UiButton.text(
        onPressed: () => _navigateToForgotPasswordScreen(context),
        label: UiText.captionRegular(
          S.of(context).forgotPassword,
          color: Theme.of(context).colorPalette.blue,
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SignInBloc, SignInState, Email>(
      selector: (state) => state.email,
      builder: (context, email) {
        return UiTextInput(
          label: S.of(context).emailWithAsterisk,
          initialValue: email.value,
          hasError: !email.isPure && !email.isValid,
          errorText: email.displayError?.toString(),
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          onChanged: (value) {
            context.read<SignInBloc>().add(EmailChanged(email: value));
          },
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SignInBloc, SignInState, Password>(
      selector: (state) => state.password,
      builder: (context, password) {
        return UiTextInput.obscure(
          initialValue: password.value,
          obscureText: true,
          hasError: !password.isPure && !password.isValid,
          label: S.of(context).passwordWithAsterisk,
          errorText: password.displayError?.toString(),
          onChanged: (value) {
            context.read<SignInBloc>().add(PasswordChanged(password: value));
          },
          textInputAction: TextInputAction.done,
        );
      },
    );
  }
}
