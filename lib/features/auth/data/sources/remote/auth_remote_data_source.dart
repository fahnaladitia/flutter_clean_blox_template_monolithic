import 'package:flutter_clean_blox_template/core/core.dart';
import 'package:flutter_clean_blox_template/features/auth/data/sources/local/entities/auth_entity.dart';
import 'package:flutter_clean_blox_template/features/auth/data/sources/remote/dtos/res/sign_in_response.dart';

import 'dtos/req/refresh_token_request.dart';
import 'dtos/req/sign_in_request.dart';
import 'dtos/req/sign_up_request.dart';
import 'dtos/res/refresh_token_response.dart';

abstract class AuthRemoteDataSource {
  Future<AuthEntity> signIn(SignInRequest request);

  Future<AuthEntity> signUp(SignUpRequest request);

  Future<String> refreshAccessToken(RefreshTokenRequest request);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AppRestClient client;

  AuthRemoteDataSourceImpl({required this.client});

  @override
  Future<AuthEntity> signIn(SignInRequest request) async {
    // final response = await client.post(
    //   '/v1/auth/sign-in',
    //   data: request.toJson(),
    // );

    final response = SignInResponse(
      data: SignInResponseData(
        accessToken: 'mock_access_token',
        refreshToken: 'mock_refresh_token',
        userId: 'mock_user_id',
      ),
    );

    return AuthEntity.fromSignInResponse(response);
  }

  @override
  Future<AuthEntity> signUp(SignUpRequest request) async {
    final response = await client.post(
      '/v1/auth/sign-up',
      data: request.toJson(),
    );
    return AuthEntity.fromSignUpResponse(response.data);
  }

  @override
  Future<String> refreshAccessToken(RefreshTokenRequest request) async {
    final response = await client.post(
      '/v1/auth/refresh-token',
      data: request.toJson(),
    );
    final refreshTokenResponse = RefreshTokenResponse.fromJson(
      response.data,
    ).data;
    if (refreshTokenResponse?.accessToken == null) {
      throw NetworkException(
        code: "INVALID_RESPONSE",
        message: "Access token is null in the response",
      );
    }
    return refreshTokenResponse?.accessToken ?? '';
  }
}
