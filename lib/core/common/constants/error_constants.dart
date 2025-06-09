// ignore: dangling_library_doc_comments
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
}
