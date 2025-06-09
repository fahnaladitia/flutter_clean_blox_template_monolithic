import 'package:dio/dio.dart';
import 'package:flutter_clean_blox_template/core/di/injection.dart';
import 'package:flutter_clean_blox_template/data/sources/local/databases/auth_database.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

class TokenInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final authDatabase = getIt.get<AuthDatabase>();

    // Retrieve the token from the AuthDatabase
    final cred = await authDatabase.getCredential();
    final token = cred?.token;

    if (token == null) {
      // If no token is found, proceed without modifying the request
      return super.onRequest(options, handler);
    }

    options.headers['Authorization'] = 'Bearer $token';
    super.onRequest(options, handler);
  }
}
