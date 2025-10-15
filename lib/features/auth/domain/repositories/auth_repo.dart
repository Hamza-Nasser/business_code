import 'package:business_code/features/auth/domain/entities/user.dart';

abstract class AuthRepo {
  Future<void> clearDBCache();
  Future<void> signOut();

  /// Retrieve the logged in user from the cache
  Future<User> retrieveLoggedInUser();
}
