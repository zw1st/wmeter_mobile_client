import 'package:decimal/decimal.dart';
import 'package:wmeter_mobile_client/domain/enum/meter_type.dart';
import 'package:wmeter_mobile_client/utils/result_pattern.dart';

import '../models/meter_model.dart';
import '../models/reading_model.dart';

abstract interface class MeterRepoInterface {
  Future<Result<MeterModel>> createMeter(MeterType meterType);

  Future<Result<List<MeterModel>>> getMeters();

  Future<Result<MeterModel>> updateCheckDate({
    required int meterId,
    required DateTime date,
  });

  Future<Result<List<ReadingModel>>> getReadingsByMeterId(int meterId);

  Future<Result<ReadingModel>> addReading({
    required Decimal value,
    required int meterId,
  });
}
