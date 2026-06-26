import 'package:decimal/decimal.dart';

class Reading {
  final int id;
  final DateTime createdAt;
  final Decimal value;
  final int meterId;

  Reading(this.id, this.createdAt, this.value, this.meterId);
}
