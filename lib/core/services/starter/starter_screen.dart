import 'dart:io';

import 'package:business_code/configurations/navigation/navigator_extensions.dart';
import 'package:business_code/configurations/navigation/screen.dart';
import 'package:business_code/configurations/navigation/screen_route_enum.dart';
import 'package:business_code/features/auth/presentation/screens/signin/signin_screen.dart';
import 'package:business_code/features/card_management/presentation/screens/scan_new_card/scan_new_card_screen.dart';
import 'package:business_code/shell/app_shell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_actions/quick_actions.dart';

import 'bloc/starter_screen_bloc.dart';

class StarterScreen extends StatefulScreen {
  const StarterScreen({super.key});

  @override
  State<StarterScreen> createState() => _StarterScreenState();

  @override
  ScreenRoute get screenRoute => ScreenRoute.starter;
}

class _StarterScreenState extends State<StarterScreen> {
  @override
  void initState() {
    super.initState();

    _configureQuickActions(context);
  }

  String shortcut = 'no action set';
  int _semaphore = 0;

  void _configureQuickActions(BuildContext context) {
    const QuickActions quickActions = QuickActions();
    quickActions.initialize((String shortcutType) {
      setState(() {
        shortcut = shortcutType;
      });
      if (shortcutType == 'action_scan' && _semaphore == 0) {
        context.push(ScanNewCardScreen());
        _semaphore = 1;
      }
    });

    String icon = Platform.isAndroid ? 'ic_launcher' : 'AppIcon';

    quickActions
        .setShortcutItems(<ShortcutItem>[
          ShortcutItem(
            type: 'action_scan',
            localizedTitle: 'Scan Card',
            icon: icon,
          ),
          ShortcutItem(
            type: 'action_cards',
            localizedTitle: 'My Cards',
            icon: icon,
          ),
        ])
        .then((void _) {
          setState(() {
            if (shortcut == 'no action set') {
              shortcut = 'actions ready';
            }
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StarterScreenBloc, StarterScreenState>(
      bloc: StarterScreenBloc()..add(const DecideWhereToGoEvent()),
      buildWhen: (previous, current) =>
          previous.screenStartDestination != current.screenStartDestination,
      builder: (context, state) {
        return switch (state.screenStartDestination) {
          StartScreenDestination.deciding => const _Initiator(),
          StartScreenDestination.onboarding => const _Initiator(),
          StartScreenDestination.signIn => const SignInScreen(),
          StartScreenDestination.shell => const AppShell(),
        };
      },
    );
  }
}

class _Initiator extends StatelessWidget {
  const _Initiator();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
