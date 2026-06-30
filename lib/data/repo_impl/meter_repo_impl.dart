import 'package:decimal/decimal.dart';
import 'package:dio/dio.dart';
import 'package:wmeter_mobile_client/data/dtos/create_reading_request.dart';
import 'package:wmeter_mobile_client/data/dtos/reading_response.dart';
import 'package:wmeter_mobile_client/domain/enum/meter_type.dart';
import 'package:wmeter_mobile_client/domain/models/meter_model.dart';
import 'package:wmeter_mobile_client/domain/models/reading_model.dart';
import 'package:wmeter_mobile_client/domain/repo_contracts/meter_repo.dart';
import 'package:wmeter_mobile_client/utils/result_pattern.dart';

import '../dtos/create_meter_request.dart';
import '../dtos/meter_response.dart';
import '../dtos/update_check_date_request.dart';
import '../network/api_constants.dart';
import '../network/error_mapper.dart';

class MeterRepoImpl implements MeterRepoInterface {
  final Dio _dio;

  MeterRepoImpl(this._dio);

  @override
  Future<Result<ReadingModel>> addReading({
    required Decimal value,
    required int meterId,
  }) async {
    try {
      final request = CreateReadingRequest(value: value);

      final response = await _dio.post(
        '${ApiConstants.meters}/$meterId/readings',
        data: request.toJson(),
      );

      final reading = ReadingResponse.fromJson(response.data).toDomain();

      return Result.ok(reading);
    } catch (e) {
      return Result.error(DioExceptionMapper.map(e));
    }
  }

  @override
  Future<Result<MeterModel>> createMeter(MeterType meterType) async {
    try {
      final request = CreateMeterRequest(meterType: meterType);

      final response = await _dio.post(
        ApiConstants.meters,
        data: request.toJson(),
      );

      final meter = MeterResponse.fromJson(response.data).toDomain();

      return Result.ok(meter);
    } catch (e) {
      return Result.error(DioExceptionMapper.map(e));
    }
  }

  @override
  Future<Result<List<MeterModel>>> getMeters() async {
    try {
      final response = await _dio.get(ApiConstants.meters);

      final meters = (response.data as List)
          .map((json) => MeterResponse.fromJson(json))
          .map((dto) => dto.toDomain())
          .toList();

      return Result.ok(meters);
    } catch (e) {
      return Result.error(DioExceptionMapper.map(e));
    }
  }

  @override
  Future<Result<List<ReadingModel>>> getReadingsByMeterId(int meterId) async {
    try {
      final response = await _dio.get(
        '${ApiConstants.meters}/$meterId/readings',
      );

      final readings = (response.data as List)
          .map((json) => ReadingResponse.fromJson(json))
          .map((dto) => dto.toDomain())
          .toList();

      return Result.ok(readings);
    } catch (e) {
      return Result.error(DioExceptionMapper.map(e));
    }
  }

  @override
  Future<Result<MeterModel>> updateCheckDate({
    required int meterId,
    required DateTime date,
  }) async {
    try {
      final request = UpdateCheckDateRequest(lastCheck: date);

      final response = await _dio.patch(
        '${ApiConstants.meters}/$meterId/check',
        data: request.toJson(),
      );

      final meter = MeterResponse.fromJson(response.data).toDomain();

      return Result.ok(meter);
    } catch (e) {
      return Result.error(DioExceptionMapper.map(e));
    }
  }
}
