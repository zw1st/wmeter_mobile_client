import 'package:decimal/decimal.dart';

import '../../domain/enum/meter_type.dart';
import '../../domain/models/meter_model.dart';

class MeterResponse {
  final int id;
  final String type;
  final DateTime createdAt;
  final int userId;
  final DateTime? lastCheckDate;
  final Decimal currentValue;

  const MeterResponse({
    required this.id,
    required this.type,
    required this.createdAt,
    required this.userId,
    required this.lastCheckDate,
    required this.currentValue,
  });

  factory MeterResponse.fromJson(Map<String, dynamic> json) {
    return MeterResponse(
      id: json['id'],
      type: json['type'],
      createdAt: DateTime.parse(json['created_at']),
      userId: json['user_id'],
      lastCheckDate: json['last_check_date'] == null
          ? null
          : DateTime.parse(json['last_check_date']),
      currentValue: Decimal.parse(json['current_value'].toString()),
    );
  }

  MeterModel toDomain() {
    return MeterModel(
      id: id,
      meterType: MeterType.values.byName(type),
      createdAt: createdAt,
      lastCheckDate: lastCheckDate,
      currentValue: currentValue,
    );
  }
}
