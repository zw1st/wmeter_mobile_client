import 'package:decimal/decimal.dart';

class CreateReadingRequest {
  final Decimal value;

  CreateReadingRequest({required this.value});

  Map<String, dynamic> toJson() => {'value': value.toString()};
}
