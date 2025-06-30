part of 'constants.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

class ErrorCodeConstants {
  ErrorCodeConstants._();
  // Network error codes
  static const String connectionTimeoutCode = 'CONNECTION_TIMEOUT_CODE';
  static const String receiveTimeoutCode = 'RECEIVE_TIMEOUT_CODE';
  static const String sendTimeoutCode = 'SEND_TIMEOUT_CODE';
  static const String cancelCode = 'CANCEL_CODE';
  static const String badCertificateCode = 'BAD_CERTIFICATE_CODE';
  static const String noInternetConnectionCode = 'NO_INTERNET_CONNECTION_CODE';
  static const String unknownCode = 'UNKNOWN_CODE';
  // Authentication error codes
  static const String unauthorizedCode = 'UNAUTHORIZED_CODE';
  static const String forbiddenCode = 'FORBIDDEN_CODE';
  static const String notFoundCode = 'NOT_FOUND_CODE';
  static const String conflictCode = 'CONFLICT_CODE';
  static const String internalServerErrorCode = 'INTERNAL_SERVER_ERROR_CODE';

  // Database error codes
}

class ErrorMessageConstants {
  ErrorMessageConstants._();
  static const String connectionTimeoutMessage =
      'Connection timeout with server';
  static const String receiveTimeoutMessage =
      'Receive timeout in connection with server';
  static const String sendTimeoutMessage =
      'Send timeout in connection with server';
  static const String cancelMessage = 'Request to server has been cancelled';
  static const String badCertificateMessage = 'Invalid SSL certificate';
  static const String noInternetConnectionMessage = 'No internet connection';
  static const String unknownMessage = 'Unknown error';
  static const String unauthorizedMessage = 'Unauthorized access';
  static const String forbiddenMessage = 'Access to the resource is forbidden';
  static const String notFoundMessage = 'Resource not found';
  static const String conflictMessage =
      'Conflict occurred while processing the request';
  static const String internalServerErrorMessage =
      'Internal server error occurred';
}
