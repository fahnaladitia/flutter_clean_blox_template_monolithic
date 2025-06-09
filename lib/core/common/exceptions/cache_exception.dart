import 'package:flutter_clean_blox_template/core/common/exceptions/base_exception.dart';

class CacheException extends BaseException {
  final String cause;
  CacheException({required this.cause})
    : super(
        code: 'CACHE_ERROR',
        message:
            'An error occurred while accessing the cache: ${cause.toString()}, please try again later. see logs for more details.',
      );

  @override
  List<Object?> get props => [cause];

  @override
  bool get stringify => true;
}
