import 'package:flutter_clean_blox_template/core/common/constants/app_constants.dart';
import 'package:flutter_clean_blox_template/core/common/exceptions/cache_exception.dart';
import 'package:flutter_clean_blox_template/data/sources/local/entities/credential_entity.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

class AuthDatabase {
  final FlutterSecureStorage _storage;
  AuthDatabase([FlutterSecureStorage? storage])
    : _storage =
          storage ??
          FlutterSecureStorage(
            aOptions: AndroidOptions.defaultOptions.copyWith(
              encryptedSharedPreferences: true,
            ),
          );

  static const String _userIdKey = 'user_id';
  static const String _token = 'auth_token';
  static const String _refreshToken = 'refresh_token';

  Future<void> saveCredential(CredentialEntity credEntity) async {
    try {
      await _storage.write(key: _token, value: credEntity.token);
      await _storage.write(key: _refreshToken, value: credEntity.refreshToken);
      await _storage.write(key: _userIdKey, value: credEntity.userId);
    } catch (e, stackTrace) {
      logger.e(
        'Failed to save credential: ${credEntity.toString()}',
        error: e,
        stackTrace: stackTrace,
      );
      throw CacheException(cause: e.toString());
    }
  }

  Future<CredentialEntity?> getCredential() async {
    try {
      final token = await _storage.read(key: _token);
      final refreshToken = await _storage.read(key: _refreshToken);
      final userId = await _storage.read(key: _userIdKey);

      if (token != null && userId != null) {
        return CredentialEntity(
          token: token,
          refreshToken: refreshToken ?? '',
          userId: userId,
        );
      }
      return null;
    } catch (e) {
      logger.e('Failed to get credential', error: e);
      throw CacheException(cause: e.toString());
    }
  }

  Future<bool> get isSignedIn async {
    try {
      final token = await _storage.read(key: _token);
      return token != null;
    } catch (e) {
      logger.e('Failed to check sign-in status', error: e);
      throw CacheException(cause: e.toString());
    }
  }

  Future<void> clear() async {
    await _storage.deleteAll();
  }
}
