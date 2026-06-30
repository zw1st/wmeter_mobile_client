import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../storages/token_storage.dart';
import 'auth_interceptor.dart';

class DioClient {
  final Dio _dio;

  DioClient({
    required String baseUrl,
    Duration? connectTimeout,
    Duration? receiveTimeout,
    required TokenStorageInterface tokenStorage,
  }) : _dio = Dio(
         BaseOptions(
           baseUrl: baseUrl,
           connectTimeout: connectTimeout ?? const Duration(seconds: 15),
           receiveTimeout: receiveTimeout ?? const Duration(seconds: 15),
           headers: {HttpHeaders.contentTypeHeader: ContentType.json.mimeType},
         ),
       ) {
    _dio.interceptors.add(AuthInterceptor(tokenStorage));
    _setupLogging();
  }

  void _setupLogging() {
    if (kDebugMode) {
      _dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          compact: true,
          maxWidth: 90,
          logPrint: (object) => debugPrint(object.toString()),
        ),
      );
    }
  }

  Dio get instance => _dio;
}
