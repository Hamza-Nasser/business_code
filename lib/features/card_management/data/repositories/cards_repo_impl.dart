import 'package:business_code/core/memory_cache/memory_cache.dart';
import 'package:business_code/features/card_management/data/datasources/local/cards_local_ds.dart';
import 'package:business_code/features/card_management/data/mappers/card_details_dto_mapper.dart';
import 'package:business_code/features/card_management/domain/entities/card_details.dart';
import 'package:business_code/features/card_management/domain/repositories/cards_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CardsRepository)
final class CardsRepoImpl implements CardsRepository {
  final CardsLocalDataSource _localDataSource;
  final MemoryCache _memoryCache;
  final CardDetailsDtoMapper _mapper;

  static const _inMemoryKey = 'cards';

  const CardsRepoImpl(this._localDataSource, this._memoryCache, this._mapper);

  @override
  Future<List<CardDetails>> fetchCards() async {
    final inMemoryCards = _memoryCache.get<List<CardDetails>>(_inMemoryKey);
    if (inMemoryCards != null) {
      return inMemoryCards;
    }

    final localCards = await _localDataSource.fetchCards();
    final cards = localCards.map((e) => _mapper.toDomain(e)).toList();
    _memoryCache.set(_inMemoryKey, cards);
    return cards;
  }

  @override
  Future<void> saveCard(CardDetails card) async {
    final dto = _mapper.fromDomain(card);
    await _localDataSource.saveCard(dto);

    _memoryCache.clear(_inMemoryKey);
  }
}
