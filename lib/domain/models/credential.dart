import 'package:equatable/equatable.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

/// Represents a user's credential information, including user ID, token, and refresh token.
/// This class is used to manage authentication state and secure user sessions.
/// It implements Equatable to allow easy comparison and equality checks.
/// Example usage:
/// ```dart
/// final credential = Credential(userId: '123', token: 'abc', refreshToken: 'xyz');
/// print(credential.userId); // Output: 123
/// ```

class Credential extends Equatable {
  final String userId;
  final String token;
  final String refreshToken;

  const Credential({
    required this.userId,
    required this.token,
    required this.refreshToken,
  });

  @override
  List<Object> get props => [userId, token, refreshToken];

  @override
  bool get stringify => true;
}
