import 'package:business_code/core/network/error/server_exceptions.dart';

class ProviderAuthCanceled extends ServerException {
  const ProviderAuthCanceled([super.message]);
}

class ProviderAuthFailed extends ServerException {
  const ProviderAuthFailed([super.message]);
}
