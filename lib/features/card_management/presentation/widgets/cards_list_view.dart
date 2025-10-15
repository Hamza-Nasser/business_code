import 'package:business_code/configurations/ui/theme/theme_data.dart';
import 'package:business_code/features/card_management/domain/entities/card_details.dart';
import 'package:business_code/features/card_management/presentation/bloc/card_management_bloc.dart';
import 'package:business_code/features/card_management/presentation/widgets/ui_card_details.dart';
import 'package:business_code/shared/ui/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardsListView extends StatelessWidget {
  const CardsListView({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).colorPalette;
    return BlocSelector<
      CardManagementBloc,
      CardManagementState,
      List<CardDetails>
    >(
      selector: (state) => state.cards,
      builder: (context, cards) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UiText.baseMedium("My Cards"),
                UiText.baseMedium(
                  "Cards (${cards.length})",
                  color: palette.dark05,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: cards.length,
                itemBuilder: (context, index) {
                  return UiCardDetails(card: cards[index]);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
