import 'package:business_code/core/string_manipulators/string_validation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class TokensSecureStorage {
  Future<void> updateTokens({String? accessToken});

  Future<void> saveAccessToken(String accessToken);

  Future<void> saveRefreshToken(String refreshToken);

  Future<bool> hasAccessToken();

  Future<void> deleteAccessToken();

  Future<void> deleteRefreshToken();

  Future<String?> getAccessToken();

  Future<String?> getRefreshToken();

  Future<void> clearTokens();
}

class TokensSecureStorageImpl implements TokensSecureStorage {
  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  static const _apiAccessTokenKey = "apiAccessToken";
  static const _apiRefreshTokenKey = "apiRefreshToken";
  @override
  Future<void> updateTokens({String? accessToken}) async {
    if (accessToken.hasActualValue) {
      await _secureStorage.write(key: _apiAccessTokenKey, value: accessToken);
    }
  }

  @override
  Future<void> saveAccessToken(String accessToken) async {
    await _secureStorage.write(key: _apiAccessTokenKey, value: accessToken);
  }

  @override
  Future<void> saveRefreshToken(String refreshToken) async {
    await _secureStorage.write(key: _apiRefreshTokenKey, value: refreshToken);
  }

  @override
  Future<bool> hasAccessToken() async {
    final apiAccessToken = await _secureStorage.read(key: _apiAccessTokenKey);
    return apiAccessToken.hasActualValue;
  }

  @override
  Future<void> deleteAccessToken() async {
    await _secureStorage.delete(key: _apiAccessTokenKey);
  }

  @override
  Future<void> deleteRefreshToken() async {
    await _secureStorage.delete(key: _apiRefreshTokenKey);
  }

  @override
  Future<String?> getAccessToken() async {
    final apiAccessToken = await _secureStorage.read(key: _apiAccessTokenKey);
    return apiAccessToken;
  }

  @override
  Future<String?> getRefreshToken() async {
    final apiRefreshToken = await _secureStorage.read(key: _apiRefreshTokenKey);
    return apiRefreshToken;
  }

  @override
  Future<void> clearTokens() async {
    await _secureStorage.deleteAll();
  }
}
