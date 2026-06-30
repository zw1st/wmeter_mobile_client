import 'package:wmeter_mobile_client/domain/models/auth_model.dart';

class AuthResponse {
  final String accessToken;

  const AuthResponse(this.accessToken);

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      AuthResponse(json['accessToken'] as String);

  AuthModel toDomain() => AuthModel(accessToken);
}
