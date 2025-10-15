import 'package:business_code/configurations/ui/theme/theme_data.dart';
import 'package:business_code/features/auth/presentation/screens/signin/bloc/sign_in_bloc.dart';
import 'package:business_code/generated/l10n.dart';
import 'package:business_code/shared/ui/widgets/buttons/gradient_button.dart';
import 'package:business_code/shared/ui/widgets/circular_loading.dart';
import 'package:business_code/shared/ui/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isValid = context.select((SignInBloc bloc) => bloc.state.isValid);
    final isLoading = context.select(
      (SignInBloc bloc) => bloc.state.status.isInProgress,
    );

    return GradientButton(
      key: const ValueKey("submit"),
      onPressed: isValid
          ? () => context.read<SignInBloc>().add(FormSubmitted())
          : null,
      enabled: !isLoading,
      label: isLoading
          ? CircularLoading()
          : UiText.baseRegular(
              S.of(context).login,
              color: Theme.of(context).colorPalette.white,
            ),
    );
  }
}
