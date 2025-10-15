import 'package:business_code/configurations/ui/theme/theme_data.dart';
import 'package:business_code/features/card_management/presentation/bloc/card_management_bloc.dart';
import 'package:business_code/features/card_management/presentation/widgets/cards_list_empty_view.dart';
import 'package:business_code/features/card_management/presentation/widgets/cards_list_view.dart';
import 'package:business_code/features/card_management/presentation/widgets/list_cards_error_view.dart';
import 'package:business_code/shared/ui/widgets/circular_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardsListStateBuilder extends StatelessWidget {
  const CardsListStateBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).colorPalette;
    return BlocSelector<
      CardManagementBloc,
      CardManagementState,
      CardManagementStatus
    >(
      selector: (state) => state.fetchCardsStatus,
      builder: (context, state) => switch (state) {
        CardManagementStatus.initial || CardManagementStatus.loading => Center(
          child: CircularLoading(color: palette.primary, size: 22),
        ),
        CardManagementStatus.failure => ListCardsErrorView(),
        CardManagementStatus.empty => CardsListEmptyView(),
        CardManagementStatus.success => CardsListView(),
      },
    );
  }
}
