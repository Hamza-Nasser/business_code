import 'dart:io';

import 'package:business_code/core/network/client/interceptors/refresh_token_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../error/server_exceptions.dart';
import 'endpoints.dart';
import 'interceptors/authorization_interceptor.dart';
import 'interceptors/error_interceptor.dart';
import 'interceptors/retry_interceptor.dart';
import 'restful_client.dart';
import 'status_code.dart';

typedef ProgressCallback = void Function(int count, int total);

@LazySingleton(as: RestfulClient)
class DioRestfulClient implements RestfulClient {
  static final Dio client = Dio();
  static const Duration timeout = Duration(seconds: 5);

  DioRestfulClient() {
    client.options.baseUrl = Endpoints.baseUrl;
    client.options.headers = {
      Headers.acceptHeader: Headers.jsonContentType,
      Headers.contentTypeHeader: Headers.jsonContentType,
    };
    client.options.connectTimeout = timeout;
    client.options.receiveTimeout = timeout;
    if (kDebugMode) {
      client.interceptors.add(
        LogInterceptor(
          request: true,
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
          error: true,
          logPrint: (log) => debugPrint(log.toString()),
        ),
      );
    }

    client.interceptors.addAll([
      AuthInterceptor(),
      ErrorInterceptor(),
      RetryInterceptor(client),
      RefreshTokenInterceptor(client),
    ]);
  }

  @override
  Future delete(
    String path, {
    dynamic queryParameters,
    ProgressCallback? onReceiveProgress,
    ProgressCallback? onSendProgress,
  }) async {
    try {
      final response = await client.delete(
        path,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      _errorHandler(e);
    }
  }

  @override
  Future get(
    String path, {
    dynamic queryParameters,
    ProgressCallback? onReceiveProgress,
    ProgressCallback? onSendProgress,
  }) async {
    try {
      final response = await client.get(path, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      _errorHandler(e);
    }
  }

  @override
  Future patch(
    String path, {
    dynamic queryParameters,
    dynamic body,
    ProgressCallback? onReceiveProgress,
    ProgressCallback? onSendProgress,
  }) async {
    try {
      final response = await client.patch(
        path,
        queryParameters: queryParameters,
        data: body,
      );
      return response.data;
    } on DioException catch (e) {
      _errorHandler(e);
    }
  }

  @override
  Future post(
    String path, {
    dynamic queryParameters,
    dynamic body,
    ProgressCallback? onReceiveProgress,
    ProgressCallback? onSendProgress,
  }) async {
    try {
      final response = await client.post(
        path,
        queryParameters: queryParameters,
        data: body,
      );
      return response.data;
    } on DioException catch (e) {
      _errorHandler(e);
    }
  }

  @override
  Future put(
    String path, {
    dynamic queryParameters,
    dynamic body,
    ProgressCallback? onReceiveProgress,
    ProgressCallback? onSendProgress,
  }) async {
    try {
      final response = await client.put(
        path,
        queryParameters: queryParameters,
        data: body,
      );
      return response.data;
    } on DioException catch (e) {
      _errorHandler(e);
    }
  }

  void _errorHandler(DioException e) {
    String? errorMsg = _extractErrorMsgFromResponse(e.response!);
    if (e.error is SocketException) {
      throw const NoInternetConnectionException();
    }
    if (e.response?.statusCode == StatusCode.unauthorized) {
      throw UnauthorizedException(errorMsg);
    }
    if (e.response?.statusCode == StatusCode.badRequest) {
      throw BadRequestException(errorMsg);
    }
    if (e.response?.statusCode == StatusCode.notFound) {
      throw NotFoundException(errorMsg);
    }
    if (e.response?.statusCode == StatusCode.internalServerError) {
      throw ServerException(errorMsg);
    }
    throw CustomException(errorMsg);
  }

  String _extractErrorMsgFromResponse(Response response) {
    if (response.data['message'] != null) {
      return response.data['message'];
    }
    if (response.data['errors'] != null) {
      final errors = response.data['errors'];
      final error = errors[0];
      final errorMsg = error['msg'];
      return errorMsg;
    }
    if (response.data['error'] != null) {
      return response.data['error'];
    }
    return "Something went wrong";
  }
}
