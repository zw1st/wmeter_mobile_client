import 'package:decimal/decimal.dart';

import '../../domain/models/reading_model.dart';

class ReadingResponse {
  final int id;
  final DateTime createdAt;
  final Decimal value;
  final int meterId;

  const ReadingResponse({
    required this.id,
    required this.createdAt,
    required this.value,
    required this.meterId,
  });

  factory ReadingResponse.fromJson(Map<String, dynamic> json) {
    return ReadingResponse(
      id: json['id'],
      createdAt: DateTime.parse(json['created_at']),
      value: Decimal.parse(json['value'].toString()),
      meterId: json['meter_id'],
    );
  }

  ReadingModel toDomain() {
    return ReadingModel(
      id: id,
      createdAt: createdAt,
      value: value,
      meterId: meterId,
    );
  }
}
