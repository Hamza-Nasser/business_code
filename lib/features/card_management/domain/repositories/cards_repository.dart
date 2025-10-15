import 'package:business_code/features/card_management/domain/entities/card_details.dart';

abstract class CardsRepository {
  Future<List<CardDetails>> fetchCards();

  Future<void> saveCard(CardDetails card);
}
