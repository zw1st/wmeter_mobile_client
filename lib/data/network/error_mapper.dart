import 'package:dio/dio.dart';

import '../../domain/exceptions/exceptions.dart';

abstract final class DioExceptionMapper {
  const DioExceptionMapper._();

  static AppException map(Object error) {
    if (error is! DioException) {
      return const UnknownException('Unexpected error');
    }

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const NetworkException('Connection timed out');

      case DioExceptionType.connectionError:
        return const NetworkException('No internet connection');

      case DioExceptionType.cancel:
        return const NetworkException('Request was cancelled');

      case DioExceptionType.badCertificate:
        return const NetworkException('Invalid SSL certificate');

      case DioExceptionType.badResponse:
        return _mapStatusCode(error);

      case DioExceptionType.unknown:
        return const UnknownException('Unexpected error');
    }
  }

  static AppException _mapStatusCode(DioException error) {
    final response = error.response;

    if (response == null) {
      return const UnknownException('Unexpected error');
    }

    final detail = _extractMessage(response.data);

    switch (response.statusCode) {
      case 400:
        return ValidationException(detail ?? 'Bad request');

      case 401:
        return UnauthorizedException(detail ?? 'Unauthorized');

      case 403:
        return UnauthorizedException(detail ?? 'Access denied');

      case 404:
        return NotFoundException(detail ?? 'Resource not found');

      case 409:
        return ValidationException(detail ?? 'Conflict');

      case 500:
      case 502:
      case 503:
        return ServerException(detail ?? 'Internal server error');

      default:
        return UnknownException(detail ?? 'Unexpected error');
    }
  }

  static String? _extractMessage(dynamic data) {
    if (data is Map<String, dynamic>) {
      final detail = data['detail'];

      if (detail is String) {
        return detail;
      }
    }

    return null;
  }
}
