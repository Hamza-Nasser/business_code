import 'package:business_code/core/app_exceptions/app_exceptions.dart';

class MalFormedResponseException extends AppException {
  const MalFormedResponseException([super.message]);

  @override
  List<Object?> get props => [message];

  @override
  String toString() {
    return '$message';
  }
}
