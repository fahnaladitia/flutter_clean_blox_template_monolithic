import 'package:equatable/equatable.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

class CredentialEntity extends Equatable {
  final String? userId;
  final String? token;
  final String? refreshToken;

  const CredentialEntity({this.userId, this.token, this.refreshToken});

  factory CredentialEntity.fromJson(Map<String, dynamic> json) {
    return CredentialEntity(
      userId: json["userId"],
      token: json["token"],
      refreshToken: json["refreshToken"],
    );
  }

  Map<String, dynamic> toJson() {
    return {"userId": userId, "token": token, "refreshToken": refreshToken};
  }

  @override
  List<Object?> get props => [userId, token, refreshToken];

  @override
  bool? get stringify => true;
}
