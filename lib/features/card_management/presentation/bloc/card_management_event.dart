part of 'card_management_bloc.dart';

abstract class CardManagementEvent extends Equatable {
  const CardManagementEvent();

  @override
  List<Object?> get props => [];
}

final class FetchCards extends CardManagementEvent {
  const FetchCards({this.forceRefresh = false});

  final bool forceRefresh;

  @override
  List<Object> get props => [forceRefresh];
}

final class GenerateCardFromImage extends CardManagementEvent {
  const GenerateCardFromImage(this.imageFile);

  final File? imageFile;

  @override
  List<Object?> get props => [imageFile];
}

final class SaveNewCard extends CardManagementEvent {
  const SaveNewCard(this.card);

  final CardDetails card;

  @override
  List<Object> get props => [card];
}
