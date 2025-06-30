part of 'local.dart';

abstract class AuthDatabase {
  Future<void> saveAuth({
    required String userId,
    required String accessToken,
    required String refreshToken,
  });
  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();
  Future<String?> getUserId();
  Future<bool> isAuthenticated();
  Future<void> clear();
  Future<void> updateAccessToken(String accessToken);
}

class AuthDatabaseImpl implements AuthDatabase {
  final FlutterSecureStorage _storage;
  AuthDatabaseImpl([FlutterSecureStorage? storage])
    : _storage =
          storage ??
          FlutterSecureStorage(
            aOptions: AndroidOptions.defaultOptions.copyWith(
              encryptedSharedPreferences: true,
            ),
          );

  static const String userIdKey = 'user_id';
  static const String accessTokenKey = 'access_token';
  static const String refreshTokenKey = 'refresh_token';

  @override
  Future<void> clear() async {
    try {
      await _storage.deleteAll();
    } catch (e, s) {
      // Log the error
      AppLogger.error('Failed to clear auth data', e, s);
      throw CacheException(cause: 'Failed to clear auth data: $e');
    }
  }

  @override
  Future<String?> getAccessToken() async {
    try {
      return await _storage.read(key: accessTokenKey);
    } catch (e, s) {
      // Log the error
      AppLogger.error('Failed to get access token', e, s);
      throw CacheException(cause: 'Failed to get access token: $e');
    }
  }

  @override
  Future<String?> getRefreshToken() async {
    try {
      return await _storage.read(key: refreshTokenKey);
    } catch (e, s) {
      // Log the error
      AppLogger.error('Failed to get refresh token', e, s);
      throw CacheException(cause: 'Failed to get refresh token: $e');
    }
  }

  @override
  Future<String?> getUserId() async {
    try {
      return await _storage.read(key: userIdKey);
    } catch (e, s) {
      // Log the error
      AppLogger.error('Failed to get user ID', e, s);
      throw CacheException(cause: 'Failed to get user ID: $e');
    }
  }

  @override
  Future<bool> isAuthenticated() async {
    try {
      return await _storage.read(key: accessTokenKey) != null;
    } catch (e, s) {
      // Log the error
      AppLogger.error('Failed to check authentication', e, s);
      throw CacheException(cause: 'Failed to check authentication: $e');
    }
  }

  @override
  Future<void> saveAuth({
    required String userId,
    required String accessToken,
    required String refreshToken,
  }) async {
    try {
      await _storage.write(key: userIdKey, value: userId);
      await _storage.write(key: accessTokenKey, value: accessToken);
      await _storage.write(key: refreshTokenKey, value: refreshToken);
    } catch (e, s) {
      // Log the error
      AppLogger.error('Failed to save auth data', e, s);
      throw CacheException(cause: 'Failed to save auth data: $e');
    }
  }

  @override
  Future<void> updateAccessToken(String accessToken) async {
    try {
      await _storage.write(key: accessTokenKey, value: accessToken);
    } catch (e, s) {
      // Log the error
      AppLogger.error('Failed to update access token', e, s);
      throw CacheException(cause: 'Failed to update access token: $e');
    }
  }
}
