import 'package:flutter_clean_blox_template/features/auth/data/sources/local/auth_local_data_source.dart';
import 'package:flutter_clean_blox_template/features/auth/data/sources/local/entities/auth_entity.dart';
import 'package:flutter_clean_blox_template/features/auth/data/sources/remote/auth_remote_data_source.dart';
import 'package:flutter_clean_blox_template/features/auth/data/sources/remote/dtos/req/refresh_token_request.dart';
import 'package:flutter_clean_blox_template/features/auth/data/sources/remote/dtos/req/sign_in_request.dart';
import 'package:flutter_clean_blox_template/features/auth/data/sources/remote/dtos/req/sign_up_request.dart';
import 'package:flutter_clean_blox_template/features/auth/domain/models/auth.dart';
import 'package:flutter_clean_blox_template/features/auth/domain/repositories/auth_repository.dart';

final class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource localDataSource;
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });
  @override
  Future<String> createNewAccessToken(String refreshToken) async {
    final newAccessToken = await remoteDataSource.refreshAccessToken(
      RefreshTokenRequest(refreshToken: refreshToken),
    );

    return newAccessToken;
  }

  @override
  Future<String?> getAccessToken() async {
    final token = await localDataSource.getToken();
    return token;
  }

  @override
  Future<String?> getRefreshToken() async {
    final refreshToken = await localDataSource.getRefreshToken();
    return refreshToken;
  }

  @override
  Future<String?> getUserId() async {
    final userId = await localDataSource.getUserId();
    return userId;
  }

  @override
  Future<bool> isAuthenticated() async {
    final isAuthenticated = await localDataSource.isAuthenticated();
    return isAuthenticated;
  }

  @override
  Future<void> saveAuth(Auth auth) async {
    final entity = AuthEntity.fromDomain(auth);
    await localDataSource.saveAuth(entity);
  }

  @override
  Future<Auth> signIn({required String email, required String password}) async {
    final entity = await remoteDataSource.signIn(
      SignInRequest(email: email, password: password),
    );

    return Auth.fromEntity(entity);
  }

  @override
  Future<Auth> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    final entity = await remoteDataSource.signUp(
      SignUpRequest(email: email, password: password, name: name),
    );

    return Auth.fromEntity(entity);
  }

  @override
  Future<void> signOut() async {
    await localDataSource.clear();
  }

  @override
  Future<void> updateAccessToken(String accessToken) async {
    await localDataSource.updateAccessToken(accessToken);
  }

  @override
  Future<Auth?> getAuth() async {
    final authEntity = await localDataSource.getAuth();
    if (authEntity != null) {
      return Auth.fromEntity(authEntity);
    }
    return null;
  }
}
