import 'package:business_code/configurations/navigation/screen.dart';
import 'package:business_code/configurations/navigation/screen_route_enum.dart';
import 'package:business_code/features/auth/presentation/screens/signin/bloc/sign_in_bloc.dart';
import 'package:business_code/features/auth/presentation/screens/signin/sign_in_form.dart';
import 'package:business_code/features/auth/presentation/widgets/logo_card.dart';
import 'package:business_code/shared/ui/widgets/app_bar/ui_l10n_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatelessScreen {
  const SignInScreen({super.key});

  @override
  ScreenRoute get screenRoute => ScreenRoute.signIn;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInBloc(),
      child: Scaffold(
        appBar: UiL10nTopBar.withCloseButton(),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                spacing: 12,
                mainAxisSize: MainAxisSize.min,
                children: [const LogoCard(), const SignInForm()],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
