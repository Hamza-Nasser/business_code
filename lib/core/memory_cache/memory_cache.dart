import 'package:injectable/injectable.dart';

@Injectable()
class MemoryCache {
  static final MemoryCache instance = MemoryCache._internal();
  final Map<String, _CacheEntry> _cache = {};

  factory MemoryCache() {
    return instance;
  }

  MemoryCache._internal();

  T? get<T>(String key, {Duration maxAge = const Duration(minutes: 5)}) {
    final entry = _cache[key];
    if (entry != null && !_isExpired(entry.timestamp, maxAge)) {
      return entry.value as T?;
    }
    return null;
  }

  void set<T>(String key, T value) {
    _cache[key] = _CacheEntry(value, DateTime.now());
  }

  void clear(String key) {
    _cache.remove(key);
  }

  bool _isExpired(DateTime timestamp, Duration maxAge) {
    final now = DateTime.now();
    return now.difference(timestamp) > maxAge;
  }
}

class _CacheEntry {
  final dynamic value;
  final DateTime timestamp;

  _CacheEntry(this.value, this.timestamp);
}
