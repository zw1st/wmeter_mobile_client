import 'package:dio/dio.dart';
import 'package:wmeter_mobile_client/data/network/error_mapper.dart';
import 'package:wmeter_mobile_client/domain/models/auth_model.dart';
import 'package:wmeter_mobile_client/domain/repo_contracts/auth_repo.dart';
import 'package:wmeter_mobile_client/utils/result_pattern.dart';

import '../dtos/auth_response.dart';
import '../dtos/sign_in_request.dart';
import '../dtos/sign_up_request.dart';
import '../network/api_constants.dart';

class AuthRepoImpl implements AuthRepoInterface {
  final Dio _dio;

  AuthRepoImpl(this._dio);

  @override
  Future<Result<AuthModel>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final request = SignInRequest(email: email, password: password);

      final response = await _dio.post(
        '${ApiConstants.auth}/signin',
        data: request.toJson(),
      );

      final dto = AuthResponse.fromJson(response.data);

      return Result.ok(dto.toDomain());
    } on DioException catch (e) {
      return Result.error(DioExceptionMapper.map(e));
    }
  }

  @override
  Future<Result<AuthModel>> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final request = SignUpRequest(
        name: name,
        email: email,
        password: password,
      );

      final response = await _dio.post(
        '${ApiConstants.auth}/signup',
        data: request.toJson(),
      );

      final dto = AuthResponse.fromJson(response.data);

      return Result.ok(dto.toDomain());
    } on DioException catch (e) {
      return Result.error(DioExceptionMapper.map(e));
    }
  }
}
