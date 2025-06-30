import '../../data/sources/local/entities/auth_entity.dart';

class Auth {
  final String userId;
  final String accessToken;
  final String refreshToken;

  Auth({
    required this.userId,
    required this.accessToken,
    required this.refreshToken,
  });

  @override
  String toString() {
    return 'Auth(userId: $userId, accessToken: $accessToken, refreshToken: $refreshToken)';
  }

  factory Auth.fromEntity(AuthEntity entity) {
    return Auth(
      userId: entity.userId,
      accessToken: entity.accessToken,
      refreshToken: entity.refreshToken,
    );
  }
}
