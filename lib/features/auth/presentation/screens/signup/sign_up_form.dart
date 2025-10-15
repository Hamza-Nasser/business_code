import 'package:business_code/configurations/navigation/navigator_provider/navigator_provider.dart';
import 'package:business_code/configurations/ui/theme/theme_data.dart';
import 'package:business_code/configurations/ui/typography/typography_styles.dart';
import 'package:business_code/core/ui_extensions/fade_in_list.dart';
import 'package:business_code/core/validators/email.dart';
import 'package:business_code/core/validators/general_text.dart';
import 'package:business_code/core/validators/password.dart';
import 'package:business_code/features/auth/presentation/screens/signin/signin_screen.dart';
import 'package:business_code/features/auth/presentation/screens/signup/bloc/sign_up_bloc.dart';
import 'package:business_code/generated/l10n.dart';
import 'package:business_code/shared/ui/widgets/buttons/gradient_button.dart';
import 'package:business_code/shared/ui/widgets/circular_loading.dart';
import 'package:business_code/shared/ui/widgets/text.dart';
import 'package:business_code/shared/ui/widgets/text_inputs/text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12.0,
      children: [
        UiText.largeSemibold(S.of(context).createNewAccount),
        _FullNameInput(),
        _EmailInput(),
        _PasswordInput(),
        _ConfirmPasswordInput(),
        const SizedBox(height: 2),
        ServiceAgreement(),
        const SizedBox(height: 2),
        SignUpButton(),
        const SizedBox(height: 2),
        const _SignInLink(),
      ],
    );
  }
}

class ServiceAgreement extends StatelessWidget {
  const ServiceAgreement({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        textAlign: TextAlign.center,
        TextSpan(
          text: S.of(context).bySigningUpYouAgreeToOur,
          style: TypographyStyles.captionRegular.copyWith(
            color: Theme.of(context).colorPalette.dark05,
          ),
          children: [
            TextSpan(
              text: S.of(context).termsOfService,
              style: TypographyStyles.captionBold.copyWith(
                color: Theme.of(context).colorPalette.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FullNameInput extends StatelessWidget {
  const _FullNameInput();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SignUpBloc, SignUpState, GeneralText>(
      selector: (state) => state.fullName,
      builder: (context, name) {
        return UiTextInput(
          label: S.of(context).fullNameWithAsterisk,
          initialValue: name.value,
          hasError: !name.isPure && !name.isValid,
          errorText: name.displayError != null
              ? S.of(context).fullNameCannotBeEmpty
              : null,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          onChanged: (value) {
            context.read<SignUpBloc>().add(ChangeFullName(fullName: value));
          },
        ).fadeInList(0, false, true);
      },
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SignUpBloc, SignUpState, Email>(
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
            context.read<SignUpBloc>().add(EmailChanged(email: value));
          },
        ).fadeInList(1, false, true);
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SignUpBloc, SignUpState, Password>(
      selector: (state) => state.password,
      builder: (context, password) {
        return UiTextInput.obscure(
          initialValue: password.value,
          obscureText: true,
          hasError: !password.isPure && !password.isValid,
          label: S.of(context).passwordWithAsterisk,
          errorText: password.displayError?.toString(),
          textInputAction: TextInputAction.done,
          onChanged: (value) {
            context.read<SignUpBloc>().add(PasswordChanged(password: value));
          },
        ).fadeInList(2, false, true);
      },
    );
  }
}

class _ConfirmPasswordInput extends StatelessWidget {
  const _ConfirmPasswordInput();

  @override
  Widget build(BuildContext context) {
    final (passwordsMatch, confirmPassword) = context.select(
      (SignUpBloc bloc) =>
          (bloc.state.passwordsMatch, bloc.state.confirmPassword),
    );
    return UiTextInput.obscure(
      initialValue: confirmPassword.value,
      obscureText: true,
      hasError: !confirmPassword.isPure && !passwordsMatch,
      label: S.of(context).confirmPasswordWithAsterisk,
      errorText: !passwordsMatch ? S.of(context).passwordsDontMatch : null,
      onChanged: (value) {
        context.read<SignUpBloc>().add(ConfirmPasswordChanged(password: value));
      },
      textInputAction: TextInputAction.done,
    ).fadeInList(3, false, true);
  }
}

class _SignInLink extends StatelessWidget {
  const _SignInLink();

  void _navigateToSignUpScreen(BuildContext context) {
    const screen = SignInScreen();
    NavigatorProvider.of(context).pop(context, screen);
  }

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).colorPalette;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 4,
      children: [
        UiText.smallRegular(
          S.of(context).alreadyHaveAnAccount,
          color: palette.dark05,
        ),
        GestureDetector(
          onTap: () => _navigateToSignUpScreen(context),
          child: UiText.smallMedium(S.of(context).login, color: palette.blue),
        ),
      ],
    );
  }
}

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isValid = context.select(
      (SignUpBloc bloc) =>
          bloc.state.email.isValid &&
          bloc.state.password.isValid &&
          bloc.state.fullName.isValid &&
          bloc.state.passwordsMatch,
    );
    final isLoading = context.select(
      (SignUpBloc bloc) => bloc.state.status == SignUpStatus.loading,
    );

    return GradientButton(
      key: const ValueKey("submit"),
      onPressed: isValid
          ? () => context.read<SignUpBloc>().add(SignUp())
          : null,
      enabled: !isLoading,
      label: isLoading
          ? CircularLoading()
          : UiText.baseRegular(
              S.of(context).signUp,
              color: Theme.of(context).colorPalette.white,
            ),
    );
  }
}
