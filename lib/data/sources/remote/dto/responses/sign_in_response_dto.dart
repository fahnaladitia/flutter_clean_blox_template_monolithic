import 'package:equatable/equatable.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/pahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

class SignInResponseDto extends Equatable {
  const SignInResponseDto({required this.success, required this.data});

  final bool? success;
  final SignInResponseDtoData? data;

  factory SignInResponseDto.fromJson(Map<String, dynamic> json) {
    return SignInResponseDto(
      success: json["success"],
      data: json["data"] == null
          ? null
          : SignInResponseDtoData.fromJson(json["data"]),
    );
  }

  @override
  String toString() {
    return "$success, $data, ";
  }

  @override
  List<Object?> get props => [success, data];
}

class SignInResponseDtoData extends Equatable {
  const SignInResponseDtoData({
    required this.userId,
    required this.token,
    required this.refreshToken,
  });

  final String? userId;
  final String? token;
  final String? refreshToken;

  factory SignInResponseDtoData.fromJson(Map<String, dynamic> json) {
    return SignInResponseDtoData(
      userId: json["userId"],
      token: json["token"],
      refreshToken: json["refreshToken"],
    );
  }

  @override
  String toString() {
    return "$userId, $token, $refreshToken, ";
  }

  @override
  List<Object?> get props => [userId, token, refreshToken];
}
