import 'dart:convert';

import 'package:business_code/core/services/prefs/prefs.dart';
import 'package:business_code/features/auth/data/dtos/user_dto.dart';
import 'package:business_code/features/auth/domain/entities/user.dart'
    as domain;
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton()
final class UserDatabase {
  final _userCacheKey = UserDBKeys.key;

  Future<void> save(domain.User? user) async {
    if (user == null) {
      return;
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userDataBase = UserDto.toDatabaseMap(
      UserDto(
        id: user.id,
        name: user.name,
        email: user.email,
        phone: user.phone,
      ),
    );
    await prefs.setString(_userCacheKey, jsonEncode(userDataBase));
  }

  Future<domain.User?> retrieveLoggedInUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString(_userCacheKey);
    if (data != null) {
      Map<String, dynamic> map = jsonDecode(data) as Map<String, dynamic>;
      final dto = UserDto.fromDatabaseMap(map);
      return domain.User(
        id: dto.id,
        name: dto.name,
        email: dto.email,
        phone: dto.phone,
      );
    }
    return domain.User(
      id: 5,
      name: "Nasser Jr",
      email: "nasserjr.dev@gmail.com",
      phone: "1552913380",
    );
  }

  Future<void> saveLogin([bool firstTime = false]) async {
    await PreferenceUtils.setBool(PreferencesKey.isLoggedIn, true);
  }

  Future<bool> isLoggedIn() async {
    return PreferenceUtils.getBool(PreferencesKey.isLoggedIn);
  }

  Future<void> remove() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userCacheKey);
  }
}
