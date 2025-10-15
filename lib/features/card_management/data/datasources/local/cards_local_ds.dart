import 'package:business_code/features/card_management/data/dto/card_details_dto.dart';

abstract class CardsLocalDataSource {
  Future<List<CardDetailsDto>> fetchCards();
  Future<void> saveCard(CardDetailsDto card);
}
