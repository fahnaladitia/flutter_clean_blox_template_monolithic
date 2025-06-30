class RefreshTokenResponse {
  final RefreshTokenResponseData? data;

  RefreshTokenResponse({this.data});

  factory RefreshTokenResponse.fromJson(Map<String, dynamic>? json) {
    return RefreshTokenResponse(
      data: json?['data'] != null
          ? RefreshTokenResponseData.fromJson(
              json!['data'] as Map<String, dynamic>,
            )
          : null,
    );
  }
}

class RefreshTokenResponseData {
  final String? accessToken;

  RefreshTokenResponseData({this.accessToken});

  factory RefreshTokenResponseData.fromJson(Map<String, dynamic>? json) {
    return RefreshTokenResponseData(
      accessToken: json?['access_token'] as String?,
    );
  }
}
