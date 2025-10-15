part of 'card_management_bloc.dart';

enum CardManagementStatus { initial, loading, success, empty, failure }

class CardManagementState extends Equatable {
  const CardManagementState({
    this.cards = const [],
    this.fetchCardsStatus = CardManagementStatus.initial,
    this.cardPreview,
    this.generateCardStatus = CardManagementStatus.initial,
    this.saveNewCardStatus = CardManagementStatus.initial,
  });

  final List<CardDetails> cards;
  final CardManagementStatus fetchCardsStatus;

  final CardDetails? cardPreview;
  final CardManagementStatus generateCardStatus;
  final CardManagementStatus saveNewCardStatus;

  CardManagementState copyWith({
    List<CardDetails>? cards,
    CardManagementStatus? fetchCardsStatus,
    CardDetails? cardPreview,
    CardManagementStatus? generateCardStatus,
    CardManagementStatus? saveNewCardStatus,
  }) {
    return CardManagementState(
      cards: cards ?? this.cards,
      fetchCardsStatus: fetchCardsStatus ?? this.fetchCardsStatus,
      cardPreview: cardPreview ?? this.cardPreview,
      generateCardStatus: generateCardStatus ?? this.generateCardStatus,
      saveNewCardStatus: saveNewCardStatus ?? this.saveNewCardStatus,
    );
  }

  @override
  List<Object?> get props => [
    cards,
    fetchCardsStatus,
    cardPreview,
    generateCardStatus,
    saveNewCardStatus,
  ];
}
