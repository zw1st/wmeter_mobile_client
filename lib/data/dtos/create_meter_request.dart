import 'package:wmeter_mobile_client/domain/enum/meter_type.dart';

class CreateMeterRequest {
  final MeterType meterType;

  CreateMeterRequest({required this.meterType});

  Map<String, dynamic> toJson() => {'type': meterType.name};
}
