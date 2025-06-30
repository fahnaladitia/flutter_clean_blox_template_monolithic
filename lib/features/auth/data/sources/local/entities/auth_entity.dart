import 'package:flutter_clean_blox_template/features/auth/data/sources/remote/dtos/res/sign_in_response.dart';
import 'package:flutter_clean_blox_template/features/auth/data/sources/remote/dtos/res/sign_up_response.dart';
import 'package:flutter_clean_blox_template/features/auth/domain/models/auth.dart';

class AuthEntity {
  final String userId;
  final String accessToken;
  final String refreshToken;

  AuthEntity({
    required this.userId,
    required this.accessToken,
    required this.refreshToken,
  });

  @override
  String toString() {
    return 'AuthEntity(userId: $userId, accessToken: $accessToken, refreshToken: $refreshToken)';
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }

  factory AuthEntity.fromSignInResponse(SignInResponse response) {
    return AuthEntity(
      userId: response.data?.userId ?? '',
      accessToken: response.data?.accessToken ?? '',
      refreshToken: response.data?.refreshToken ?? '',
    );
  }

  factory AuthEntity.fromSignUpResponse(SignUpResponse response) {
    return AuthEntity(
      userId: response.data?.userId ?? '',
      accessToken: response.data?.accessToken ?? '',
      refreshToken: response.data?.refreshToken ?? '',
    );
  }

  factory AuthEntity.fromDomain(Auth auth) {
    return AuthEntity(
      userId: auth.userId,
      accessToken: auth.accessToken,
      refreshToken: auth.refreshToken,
    );
  }
}
