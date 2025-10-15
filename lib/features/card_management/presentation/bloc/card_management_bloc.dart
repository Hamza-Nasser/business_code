import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:business_code/core/string_manipulators/string_generation.dart';
import 'package:business_code/features/card_management/domain/entities/card_details.dart';
import 'package:business_code/features/card_management/domain/repositories/cards_repository.dart';
import 'package:equatable/equatable.dart';

part 'card_management_event.dart';
part 'card_management_state.dart';

class CardManagementBloc
    extends Bloc<CardManagementEvent, CardManagementState> {
  final CardsRepository _cardsRepository;

  CardManagementBloc(this._cardsRepository) : super(CardManagementState()) {
    on<FetchCards>(_onFetchCards);
    on<GenerateCardFromImage>(_onGenerateCardFromImage);
    on<SaveNewCard>(_onSaveNewCard);
  }

  void _onFetchCards(
    FetchCards event,
    Emitter<CardManagementState> emit,
  ) async {
    emit(state.copyWith(fetchCardsStatus: CardManagementStatus.loading));

    try {
      final cards = await _cardsRepository.fetchCards();
      emit(
        state.copyWith(
          fetchCardsStatus: cards.isEmpty
              ? CardManagementStatus.empty
              : CardManagementStatus.success,
          cards: cards,
        ),
      );
    } catch (e) {
      emit(state.copyWith(fetchCardsStatus: CardManagementStatus.failure));
    }
  }

  void _onGenerateCardFromImage(
    GenerateCardFromImage event,
    Emitter<CardManagementState> emit,
  ) async {
    emit(state.copyWith(generateCardStatus: CardManagementStatus.loading));
    try {
      // generate card data obj from image via cv.
      final mockCard = CardDetails(
        id: StringGenerator.randomUUID(),
        title: StringGenerator.randomTwoWords(),
        subtitle: StringGenerator.randomTwoWords(),
        location: StringGenerator.randomTwoWords(),
        email: StringGenerator.randomEmail(),
        extras: [StringGenerator.randomUrl(), StringGenerator.randomUrl()],
      );

      emit(
        state.copyWith(
          generateCardStatus: CardManagementStatus.success,
          cardPreview: mockCard,
        ),
      );
    } catch (e) {
      emit(state.copyWith(generateCardStatus: CardManagementStatus.failure));
    }
  }

  void _onSaveNewCard(
    SaveNewCard event,
    Emitter<CardManagementState> emit,
  ) async {
    emit(state.copyWith(saveNewCardStatus: CardManagementStatus.loading));
    try {
      await _cardsRepository.saveCard(event.card);
      emit(state.copyWith(saveNewCardStatus: CardManagementStatus.success));
    } catch (e) {
      emit(state.copyWith(saveNewCardStatus: CardManagementStatus.failure));
    }
  }
}
