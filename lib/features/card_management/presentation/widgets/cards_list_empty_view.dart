import 'package:business_code/configurations/ui/theme/theme_data.dart';
import 'package:business_code/shared/ui/widgets/text.dart';
import 'package:flutter/material.dart';

class CardsListEmptyView extends StatelessWidget {
  const CardsListEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).colorPalette;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.credit_card, size: 72, color: palette.primary),
          const SizedBox(height: 16),
          UiText.baseMedium('No cards found.'),
          const SizedBox(height: 4),
          UiText.smallRegular(
            'You don\'t have any cards yet.',
            color: palette.dark05,
          ),
        ],
      ),
    );
  }
}
