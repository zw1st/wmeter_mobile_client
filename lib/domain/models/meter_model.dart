import 'package:decimal/decimal.dart';
import 'package:wmeter_mobile_client/domain/enum/meter_type.dart';

class MeterModel {
  final int id;
  final MeterType meterType;
  final DateTime createdAt;
  final DateTime? lastCheckDate;
  final Decimal currentValue;

  const MeterModel({
    required this.id,
    required this.meterType,
    required this.createdAt,
    required this.lastCheckDate,
    required this.currentValue,
  });
}
