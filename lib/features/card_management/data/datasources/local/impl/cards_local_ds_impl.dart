import 'dart:convert';

import 'package:business_code/core/services/prefs/prefs.dart';
import 'package:business_code/features/card_management/data/datasources/local/cards_local_ds.dart';
import 'package:business_code/features/card_management/data/dto/card_details_dto.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CardsLocalDataSource)
final class CardsLocalDataSourceImpl implements CardsLocalDataSource {
  /// This is not a production caching repo, it just mimics the remote fetch.
  /// For a remote data source, there will be typically interceptors for catching exceptions,
  /// retrying, authorizing, etc.
  ///
  /// For now, any exception in this layer will delegate the handling to the Bloc it's called from.

  @override
  Future<List<CardDetailsDto>> fetchCards() async {
    final jsonString = PreferenceUtils.getString(PreferencesKey.cards);

    if (jsonString.isEmpty) return [];

    final List<dynamic> jsonList = await jsonDecode(jsonString);
    return jsonList
        .map((e) => CardDetailsDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<void> saveCard(CardDetailsDto card) async {
    final currentCards = await fetchCards();
    final existingIndex = currentCards.indexWhere((c) => c.id == card.id);

    if (existingIndex != -1) {
      // Replace existing card
      currentCards[existingIndex] = card;
    } else {
      // Add new card
      currentCards.add(card);
    }

    final jsonList = currentCards.map((c) => c.toJson()).toList();
    await PreferenceUtils.setString(PreferencesKey.cards, jsonEncode(jsonList));
  }
}
