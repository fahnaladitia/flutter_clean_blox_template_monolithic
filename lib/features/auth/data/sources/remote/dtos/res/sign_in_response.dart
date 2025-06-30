class SignInResponse {
  final SignInResponseData? data;
  final String? message;
  final int? statusCode;

  SignInResponse({this.data, this.message, this.statusCode});

  factory SignInResponse.fromJson(Map<String, dynamic>? json) {
    return SignInResponse(
      data: json != null
          ? SignInResponseData.fromJson(json['data'] as Map<String, dynamic>)
          : null,
      message: json?['message'] as String?,
      statusCode: json?['status_code'] as int?,
    );
  }
}

class SignInResponseData {
  final String? userId;
  final String? accessToken;
  final String? refreshToken;

  SignInResponseData({this.userId, this.accessToken, this.refreshToken});

  factory SignInResponseData.fromJson(Map<String, dynamic>? json) {
    return SignInResponseData(
      userId: json?['user_id'] as String?,
      accessToken: json?['access_token'] as String?,
      refreshToken: json?['refresh_token'] as String?,
    );
  }
}
