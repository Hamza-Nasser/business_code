import 'package:business_code/configurations/ui/theme/theme_data.dart';
import 'package:business_code/features/card_management/presentation/bloc/card_management_bloc.dart';
import 'package:business_code/shared/ui/widgets/buttons/gradient_button.dart';
import 'package:business_code/shared/ui/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListCardsErrorView extends StatelessWidget {
  const ListCardsErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).colorPalette;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.error_outline, color: palette.destructive, size: 72),
          const SizedBox(height: 16),
          UiText.baseMedium("Failed to load cards."),
          const SizedBox(height: 8),
          GradientButton(
            onPressed: () {
              context.read<CardManagementBloc>().add(FetchCards());
            },
            label: UiText.baseMedium("Retry"),
          ),
        ],
      ),
    );
  }
}
