import 'package:flutter_clean_blox_template/core/common/exceptions/base_exception.dart';

class NetworkException extends BaseException {
  const NetworkException({required super.message, required super.code});

  factory NetworkException.fromMap(Map<String, dynamic> map) {
    return NetworkException(
      message: map['message'] ?? 'An unknown network error occurred.',
      code: map['code'] ?? 'NETWORK_ERROR',
    );
  }
}
