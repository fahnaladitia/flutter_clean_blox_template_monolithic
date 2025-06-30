part of 'network.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

class TokenInterceptor extends InterceptorsWrapper {
  final AuthDatabase authDatabase;

  TokenInterceptor({required this.authDatabase});
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken = await authDatabase.getAccessToken();

    if (accessToken == null) {
      // If no token is found, proceed without modifying the request
      return super.onRequest(options, handler);
    }

    options.headers['Authorization'] = 'Bearer $accessToken';
    super.onRequest(options, handler);
  }
}
