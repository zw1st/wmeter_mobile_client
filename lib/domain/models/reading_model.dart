import 'package:decimal/decimal.dart';

class ReadingModel {
  final int id;
  final DateTime createdAt;
  final Decimal value;

  const ReadingModel({
    required this.id,
    required this.createdAt,
    required this.value,
  });
}
