class SignUpResponse {
  final SignUpResponseData? data;
  final String? message;
  final int? statusCode;

  SignUpResponse({this.data, this.message, this.statusCode});

  factory SignUpResponse.fromJson(Map<String, dynamic>? json) {
    return SignUpResponse(
      data: json != null
          ? SignUpResponseData.fromJson(json['data'] as Map<String, dynamic>?)
          : null,
      message: json?['message'] as String?,
      statusCode: json?['status_code'] as int?,
    );
  }
}

class SignUpResponseData {
  final String? accessToken;
  final String? refreshToken;
  final String? userId;

  SignUpResponseData({this.accessToken, this.refreshToken, this.userId});

  factory SignUpResponseData.fromJson(Map<String, dynamic>? json) {
    return SignUpResponseData(
      accessToken: json?['access_token'] as String?,
      refreshToken: json?['refresh_token'] as String?,
      userId: json?['user_id'] as String?,
    );
  }
}
