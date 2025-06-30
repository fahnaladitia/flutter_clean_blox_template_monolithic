part of 'network.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

class ErrorInterceptor extends InterceptorsWrapper {
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
            code: ErrorCodeConstants.unknownCode,
            message: 'Unknown error occurred',
          );
        }

        if (err.response!.statusCode == HttpStatus.badRequest) {
          // TODO: Handle bad request error
          return NetworkException.fromMap(err.response!.data);
        } else if (err.response!.statusCode == HttpStatus.unauthorized) {
          return NetworkException(
            code: ErrorCodeConstants.unauthorizedCode,
            message: ErrorMessageConstants.unauthorizedMessage,
          );
        } else if (err.response!.statusCode == HttpStatus.forbidden) {
          return NetworkException(
            code: ErrorCodeConstants.forbiddenCode,
            message: ErrorMessageConstants.forbiddenMessage,
          );
        } else if (err.response!.statusCode == HttpStatus.notFound) {
          return NetworkException(
            code: ErrorCodeConstants.notFoundCode,
            message: ErrorMessageConstants.notFoundMessage,
          );
        } else if (err.response!.statusCode == HttpStatus.internalServerError) {
          return NetworkException(
            code: ErrorCodeConstants.internalServerErrorCode,
            message: ErrorMessageConstants.internalServerErrorMessage,
          );
        }

        return NetworkException(
          code: ErrorCodeConstants.unknownCode,
          message: err.response!.toString(),
        );
    }
  }
}
