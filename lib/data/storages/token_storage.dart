abstract interface class TokenStorageInterface {
  Future<void> saveToken(String token);

  Future<String?> getToken();

  Future<void> clearToken();

  Future<bool> hasToken();
}
