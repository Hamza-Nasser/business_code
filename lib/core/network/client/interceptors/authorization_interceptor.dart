import 'package:business_code/core/network/client/tokens_secure_storage.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final tokensSecureStorage = TokensSecureStorageImpl();
    String? token = await tokensSecureStorage.getAccessToken();
    if (token != null) {
      options.headers["Authorization"] = "Bearer $token";
    }
    return handler.next(options);
  }
}
