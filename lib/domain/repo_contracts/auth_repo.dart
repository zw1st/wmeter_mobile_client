import 'package:wmeter_mobile_client/utils/result_pattern.dart';

import '../models/auth_model.dart';

abstract interface class AuthRepoInterface {
  Future<Result<AuthModel>> signIn({
    required String email,
    required String password,
  });

  Future<Result<AuthModel>> signUp({
    required String name,
    required String email,
    required String password,
  });
}
