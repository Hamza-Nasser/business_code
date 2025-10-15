import 'package:business_code/core/app_exceptions/app_exceptions.dart';

class DBException extends AppException {
  const DBException([super.message]);

  @override
  List<Object?> get props => [message];

  @override
  String toString() {
    return '$message';
  }
}

class NotFoundException extends DBException {
  const NotFoundException([super.message]);
}

class DuplicateEntryException extends DBException {
  const DuplicateEntryException([super.message]);
}

class UnauthorizedAccessException extends DBException {
  const UnauthorizedAccessException([super.message]);
}

class ValidationException extends DBException {
  const ValidationException([super.message]);
}

class UserNotFoundException extends DBException {
  const UserNotFoundException([super.message]);
}
