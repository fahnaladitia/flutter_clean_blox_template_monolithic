import 'package:flutter_clean_blox_template/core/core.dart';

import 'entities/auth_entity.dart';

abstract class AuthLocalDataSource {
  Future<void> saveAuth(AuthEntity entity);

  Future<String?> getToken();

  Future<String?> getRefreshToken();

  Future<String?> getUserId();

  Future<AuthEntity?> getAuth();

  Future<bool> isAuthenticated();

  Future<void> clear();

  Future<void> updateAccessToken(String accessToken);
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final AuthDatabase authDatabase;

  AuthLocalDataSourceImpl({required this.authDatabase});

  @override
  Future<void> saveAuth(AuthEntity entity) async {
    return await authDatabase.saveAuth(
      userId: entity.userId,
      accessToken: entity.accessToken,
      refreshToken: entity.refreshToken,
    );
  }

  @override
  Future<String?> getToken() async {
    return await authDatabase.getAccessToken();
  }

  @override
  Future<String?> getRefreshToken() async {
    return await authDatabase.getRefreshToken();
  }

  @override
  Future<String?> getUserId() async {
    return await authDatabase.getUserId();
  }

  @override
  Future<bool> isAuthenticated() async {
    return await authDatabase.isAuthenticated();
  }

  @override
  Future<void> clear() async {
    return await authDatabase.clear();
  }

  @override
  Future<void> updateAccessToken(String accessToken) async {
    return await authDatabase.updateAccessToken(accessToken);
  }

  @override
  Future<AuthEntity?> getAuth() async {
    final userId = await getUserId();
    final accessToken = await getToken();
    final refreshToken = await getRefreshToken();

    if (userId == null || accessToken == null || refreshToken == null) {
      return null;
    }

    return AuthEntity(
      userId: userId,
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }
}
