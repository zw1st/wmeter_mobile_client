import 'package:decimal/decimal.dart';
import 'package:wmeter_mobile_client/domain/enum/meter_type.dart';

class MeterModel {
  final int id;
  final MeterType meterType;
  final DateTime createdAt;
  final int userId;
  final DateTime? lastCheckDate;
  final Decimal currentValue;

  MeterModel(
    this.id,
    this.meterType,
    this.createdAt,
    this.userId,
    this.lastCheckDate,
    this.currentValue,
  );
}
