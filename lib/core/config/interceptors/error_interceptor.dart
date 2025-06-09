import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_clean_blox_template/core/common/constants/error_constants.dart';
import 'package:flutter_clean_blox_template/core/common/exceptions/network_exception.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

class ErrorInterceptor extends InterceptorsWrapper {
  /// Interceptor untuk menangani error dari Dio
  /// Jika ada error, interceptor ini akan mengubahnya menjadi custom exception
  /// yang lebih mudah dipahami oleh aplikasi.
  /// Ini juga akan membantu dalam menangani error secara konsisten di seluruh aplikasi.
  /// Contoh Catch:
  /// ```dart
  /// try {
  ///   final response = await dio.get('/endpoint');
  /// } on DioException catch (e) {
  ///   if (e.error is NetworkException) {
  ///     final exception = e.error as NetworkException;
  ///     // Tangani exception sesuai kebutuhan
  ///     print('Error: ${exception.message}');
  ///   } else {
  ///     // Tangani error lain yang mungkin terjadi
  ///     print('Error: ${e.message}');
  ///   }
  /// }
  /// ```
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Ubah error jadi custom exception jika ada response
    if (err.response?.data != null) {
      final exception = _getErrorException(err);
      return handler.reject(
        DioException(
          requestOptions: err.requestOptions,
          response: err.response,
          error: exception,
          type: err.type,
        ),
      );
    }
    super.onError(err, handler);
  }

  NetworkException _getErrorException(DioException err) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
        return NetworkException(
          code: ErrorCodeConstants.connectionTimeoutCode,
          message: ErrorMessageConstants.connectionTimeoutMessage,
        );
      case DioExceptionType.receiveTimeout:
        return NetworkException(
          code: ErrorCodeConstants.receiveTimeoutCode,
          message: ErrorMessageConstants.receiveTimeoutMessage,
        );
      case DioExceptionType.sendTimeout:
        return NetworkException(
          code: ErrorCodeConstants.sendTimeoutCode,
          message: ErrorMessageConstants.sendTimeoutMessage,
        );
      case DioExceptionType.cancel:
        return NetworkException(
          code: ErrorCodeConstants.cancelCode,
          message: ErrorMessageConstants.cancelMessage,
        );
      case DioExceptionType.connectionError:
        return NetworkException(
          code: ErrorCodeConstants.noInternetConnectionCode,
          message: ErrorMessageConstants.noInternetConnectionMessage,
        );
      case DioExceptionType.badCertificate:
        return NetworkException(
          code: ErrorCodeConstants.badCertificateCode,
          message: ErrorMessageConstants.badCertificateMessage,
        );
      case DioExceptionType.unknown:
        if (err.error is SocketException) {
          return NetworkException(
            code: ErrorCodeConstants.noInternetConnectionCode,
            message: ErrorMessageConstants.noInternetConnectionMessage,
          );
        }
        return NetworkException(
          code: ErrorCodeConstants.unknownCode,
          message: err.response!.toString(),
        );
      case DioExceptionType.badResponse:
        if (err.response == null) {
          return NetworkException(
            code: ErrorCodeConstants.noInternetConnectionCode,
            message: ErrorMessageConstants.noInternetConnectionMessage,
          );
        }
        if (err.response!.statusCode == 400) {
          return NetworkException(
            code: err.response!.data['code'] ?? ErrorCodeConstants.unknownCode,
            message: err.response!.data.toString(),
          );
        }

        if ((err.response!.statusCode ?? 0) >= 401 &&
            (err.response!.statusCode ?? 0) < 500) {
          // TODO: Handle from 401 to 499
          return NetworkException.fromMap(err.response!.data);
        }
        if (err.response!.statusCode == 500) {
          return NetworkException(
            code: ErrorCodeConstants.unknownCode,
            message: 'Internal Server Error',
          );
        }

        return NetworkException(
          code: ErrorCodeConstants.unknownCode,
          message: err.response!.toString(),
        );
    }
  }
}
