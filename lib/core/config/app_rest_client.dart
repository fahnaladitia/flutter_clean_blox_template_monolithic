import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:cote_network_logger/cote_network_logger.dart';
import 'package:dio/dio.dart';
import 'package:flutter_clean_blox_template/core/config/interceptors/error_interceptor.dart';
import 'package:flutter_clean_blox_template/core/config/interceptors/token_interceptor.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

class AppRestClient {
  AppRestClient._();

  static Dio instance({required String baseURL}) {
    final Dio dio = Dio();

    _configureDio(dio, baseURL: baseURL);
    _handleInterceptors(dio);

    return dio;
  }

  static void _handleInterceptors(Dio dio) {
    // Add your interceptors here
    dio.interceptors.add(CoteNetworkLogger());
    dio.interceptors.add(ChuckerDioInterceptor());
    dio.interceptors.add(TokenInterceptor());
    dio.interceptors.add(ErrorInterceptor());
  }

  static void _configureDio(Dio dio, {required String baseURL}) {
    // Configure Dio with base options
    final baseOptions = BaseOptions();

    // Set the base URL for the Dio instance
    baseOptions.baseUrl = baseURL;

    // Headers can be set here if needed
    baseOptions.headers = {'Content-Type': 'application/json', 'Accept': 'application/json'};

    baseOptions.contentType = Headers.jsonContentType;

    dio.options = baseOptions;
  }
}
