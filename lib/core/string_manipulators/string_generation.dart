extension StringGenerator on String {
  static final List<String> _wordList = [
    'apple',
    'river',
    'sun',
    'fast',
    'tiger',
    'cloud',
    'sky',
    'moon',
    'star',
    'tree',
    'wolf',
    'run',
    'grass',
    'blue',
    'stone',
    'fire',
    'silver',
    'light',
    'wind',
    'fox',
  ];

  static String randomUUID() {
    final now = DateTime.now().microsecondsSinceEpoch;
    // Combine time-based value with a randomly generated hex string for higher uniqueness.
    String randomHex(int len) {
      final chars = 'abcdef0123456789';
      return List.generate(
        len,
        (i) => chars[(now + i * 17) % chars.length],
      ).join();
    }

    return '${randomHex(8)}-${randomHex(4)}-${randomHex(4)}-${randomHex(4)}-${randomHex(12)}';
  }

  /// Generates a random string consisting of two words separated by a space.
  static String randomTwoWords() {
    final rnd = DateTime.now().microsecondsSinceEpoch;
    final word1 = _wordList[rnd % _wordList.length];
    final word2 = _wordList[(rnd ~/ 3) % _wordList.length];
    return '$word1 $word2';
  }

  /// Generates a random email string.
  static String randomEmail() {
    final rnd = DateTime.now().microsecondsSinceEpoch;
    final username =
        _wordList[rnd % _wordList.length] +
        (_wordList[(rnd ~/ 13) % _wordList.length]);
    final domains = ['example.com', 'gmail.com', 'test.org', 'random.net'];
    final domain = domains[(rnd ~/ 23) % domains.length];
    return '$username${rnd % 1000}@$domain';
  }

  /// Generates a random URL string.
  static String randomUrl() {
    final rnd = DateTime.now().microsecondsSinceEpoch;
    final subdomain = ['www', 'app', 'blog', 'portal'][(rnd ~/ 31) % 4];
    final domainName = _wordList[rnd % _wordList.length];
    final tlds = ['.com', '.io', '.net', '.org'];
    final tld = tlds[(rnd ~/ 13) % tlds.length];
    return 'https://$subdomain.$domainName$tld';
  }
}
