import 'package:business_code/configurations/di/injector.dart';
import 'package:business_code/configurations/navigation/screen.dart';
import 'package:business_code/configurations/navigation/screen_route_enum.dart';
import 'package:business_code/features/card_management/domain/repositories/cards_repository.dart';
import 'package:business_code/features/card_management/presentation/bloc/card_management_bloc.dart';
import 'package:business_code/features/card_management/presentation/widgets/cards_list_state_builder.dart';
import 'package:business_code/features/card_management/presentation/widgets/scan_new_card_float_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListCardsScreen extends StatelessScreen {
  const ListCardsScreen({super.key});

  @override
  ScreenRoute get screenRoute => ScreenRoute.listCards;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
      floatingActionButton: ScanNewCardFloatActionButton(),
      body: BlocProvider(
        create: (context) =>
            CardManagementBloc(sl<CardsRepository>())..add(FetchCards()),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: CardsListStateBuilder(),
        ),
      ),
    );
  }
}
