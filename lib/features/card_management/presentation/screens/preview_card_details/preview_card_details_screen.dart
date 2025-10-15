import 'dart:io';

import 'package:business_code/configurations/di/injector.dart';
import 'package:business_code/configurations/navigation/navigator_extensions.dart';
import 'package:business_code/configurations/navigation/screen.dart';
import 'package:business_code/configurations/navigation/screen_route_enum.dart';
import 'package:business_code/configurations/ui/theme/theme_data.dart';
import 'package:business_code/features/auth/presentation/widgets/logo_card.dart';
import 'package:business_code/features/card_management/domain/repositories/cards_repository.dart';
import 'package:business_code/features/card_management/presentation/bloc/card_management_bloc.dart';
import 'package:business_code/features/card_management/presentation/widgets/list_cards_error_view.dart';
import 'package:business_code/features/card_management/presentation/widgets/ui_card_details.dart';
import 'package:business_code/shared/ui/widgets/app_bar/ui_top_bar.dart';
import 'package:business_code/shared/ui/widgets/buttons/button.dart';
import 'package:business_code/shared/ui/widgets/buttons/gradient_button.dart';
import 'package:business_code/shared/ui/widgets/circular_loading.dart';
import 'package:business_code/shared/ui/widgets/text.dart';
import 'package:business_code/shell/app_shell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PreviewCardDetailsScreen extends StatelessScreen {
  const PreviewCardDetailsScreen({super.key, required this.image});
  final File image;

  @override
  ScreenRoute get screenRoute => ScreenRoute.previewCardDetails;

  void _listenToStateChanges(BuildContext context, CardManagementState state) {
    if (state.saveNewCardStatus == CardManagementStatus.success) {
      context.pushAndRemoveAll(const AppShell());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CardManagementBloc(sl<CardsRepository>())
            ..add(GenerateCardFromImage(image)),
      child: BlocListener<CardManagementBloc, CardManagementState>(
        listener: _listenToStateChanges,
        child: Scaffold(
          appBar: UiTopBar(
            automaticallyImplyLeading: false,
            leading: UiButton.icon(
              onPressed: () => context.pop(),
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.black,
              ),
            ),
            title: UiText.baseMedium("Card Preview"),
          ),
          body: CardPreviewBodyStateBuilder(),
        ),
      ),
    );
  }
}

class CardPreviewBodyStateBuilder extends StatelessWidget {
  const CardPreviewBodyStateBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).colorPalette;
    return BlocSelector<
      CardManagementBloc,
      CardManagementState,
      CardManagementStatus
    >(
      selector: (state) => state.generateCardStatus,
      builder: (context, state) => switch (state) {
        CardManagementStatus.initial || CardManagementStatus.loading => Center(
          child: CircularLoading(color: palette.primary, size: 22),
        ),
        CardManagementStatus.success => CardDetailsPreview(),
        _ => const ListCardsErrorView(),
      },
    );
  }
}

class CardDetailsPreview extends StatelessWidget {
  const CardDetailsPreview({super.key});

  @override
  Widget build(BuildContext context) {
    final card = context.select(
      (CardManagementBloc bloc) => bloc.state.cardPreview,
    );
    if (card == null) {
      // not gonna happen, but a defensive programming approach is taken
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          UiCardDetails(card: card),
          LogoCard(),
          const SizedBox(height: 16),
          const SaveButton(),
        ],
      ),
    );
  }
}

class SaveButton extends StatelessWidget {
  const SaveButton({super.key});

  void _triggerSave(BuildContext context) {
    final card = context.read<CardManagementBloc>().state.cardPreview;
    if (card == null) {
      return;
    }
    context.read<CardManagementBloc>().add(SaveNewCard(card));
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select(
      (CardManagementBloc bloc) =>
          bloc.state.saveNewCardStatus == CardManagementStatus.loading,
    );
    return GradientButton(
      key: const ValueKey("save"),
      onPressed: () => _triggerSave(context),
      label: isLoading ? CircularLoading() : UiText.baseMedium("Save"),
      enabled: !isLoading,
    );
  }
}
