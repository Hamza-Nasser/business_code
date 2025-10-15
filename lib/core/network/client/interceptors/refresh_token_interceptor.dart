import 'package:business_code/core/network/client/endpoints.dart';
import 'package:business_code/core/network/client/status_code.dart';
import 'package:business_code/core/network/client/tokens_secure_storage.dart';
import 'package:dio/dio.dart';

class RefreshTokenInterceptor extends Interceptor {
  final Dio dio;

  const RefreshTokenInterceptor(this.dio);

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == StatusCode.unauthorized &&
        !_isTokenRefreshAttempt(err)) {
      RequestOptions options = err.requestOptions;

      try {
        final newToken = await _refreshToken();
        if (newToken != null) {
          options.headers["Authorization"] = "Bearer $newToken";
          final response = await dio.request(
            options.path,
            options: Options(
              method: options.method,
              headers: options.headers,
              extra: options.extra,
            ),
            data: options.data,
            queryParameters: options.queryParameters,
          );
          return handler.resolve(response);
        }
      } catch (e) {
        return handler.next(e as DioException);
      }
    }
    return handler.next(err);
  }

  bool _isTokenRefreshAttempt(DioException error) {
    return error.requestOptions.path == Endpoints.refreshToken;
  }

  Future<String?> _refreshToken() async {
    final secureStorage = TokensSecureStorageImpl();
    final tokenDio = Dio();
    const refreshTokenUrl = Endpoints.refreshToken;
    tokenDio.options = dio.options;
    final interceptors = List<Interceptor>.from(dio.interceptors);
    interceptors.removeWhere((element) => element is RefreshTokenInterceptor);
    tokenDio.interceptors.addAll(interceptors);

    try {
      String? refreshToken = await secureStorage.getRefreshToken();
      if (refreshToken == null) {
        throw DioException(
          requestOptions: RequestOptions(path: refreshTokenUrl),
          error: "Refresh token not found",
        );
      }
      final response = await tokenDio.post(
        refreshTokenUrl,
        data: {"refresh_token": refreshToken},
      );

      if (response.statusCode == StatusCode.success) {
        final newToken = response.data["access_token"];
        await secureStorage.saveAccessToken(newToken);
        return newToken;
      } else {
        throw DioException(
          requestOptions: RequestOptions(path: refreshTokenUrl),
          error: "Failed to refresh token",
        );
      }
    } catch (e) {
      return null; // Handle token refresh failure (e.g., logout the user)
    }
  }
}
