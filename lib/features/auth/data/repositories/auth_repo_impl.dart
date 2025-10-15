import 'package:business_code/core/db/user_database.dart';
import 'package:business_code/core/memory_cache/memory_cache.dart';
import 'package:business_code/core/network/connection/network_info.dart';
import 'package:business_code/core/network/error/db_exceptions.dart';
import 'package:business_code/features/auth/domain/entities/user.dart';
import 'package:business_code/features/auth/domain/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AuthRepo)
final class AuthRepoImpl implements AuthRepo {
  final UserDatabase userDB;
  final NetworkInfo networkInfo;

  AuthRepoImpl(this.networkInfo, this.userDB);

  @override
  Future<void> clearDBCache() async {
    throw UnimplementedError();
  }

  @override
  Future<User> retrieveLoggedInUser() async {
    final inMemoryUser = MemoryCache.instance.get('user');
    if (inMemoryUser != null) {
      return inMemoryUser;
    }
    final user = await userDB.retrieveLoggedInUser();
    if (user != null) {
      return user;
    }
    throw const UserNotFoundException();
  }

  @override
  Future<void> signOut() async {
    throw UnimplementedError();
  }
}
