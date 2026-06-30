import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:wmeter_mobile_client/data/storages/token_storage.dart';

class SecureTokenStorage implements TokenStorageInterface {
  static const _tokenKey = 'access_token';

  final FlutterSecureStorage _storage;

  const SecureTokenStorage(this._storage);

  @override
  Future<void> saveToken(String token) {
    return _storage.write(key: _tokenKey, value: token);
  }

  @override
  Future<String?> getToken() {
    return _storage.read(key: _tokenKey);
  }

  @override
  Future<void> clearToken() {
    return _storage.delete(key: _tokenKey);
  }

  @override
  Future<bool> hasToken() async {
    return (await getToken()) != null;
  }
}
