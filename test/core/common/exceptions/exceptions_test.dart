import 'package:flutter_clean_blox_template/core/common/exceptions/base_exception.dart';
import 'package:flutter_clean_blox_template/core/common/exceptions/cache_exception.dart';
import 'package:flutter_clean_blox_template/core/common/exceptions/network_exception.dart';
import 'package:flutter_clean_blox_template/core/common/exceptions/validator_exception.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CacheException', () {
    test('should contain correct message and code', () {
      const cause = 'Disk not found';
      final exception = CacheException(cause: cause);

      expect(exception.code, 'CACHE_ERROR');
      expect(
        exception.message,
        contains('An error occurred while accessing the cache: $cause'),
      );
      expect(exception.props, [cause]);
      expect(exception.stringify, true);
    });
  });

  group('ValidatorException', () {
    test('should contain correct field and message', () {
      const field = 'email';
      const errMsg = 'Invalid format';
      final exception = ValidatorException(
        fieldName: field,
        errMessage: errMsg,
      );

      expect(exception.code, 'VALIDATION_ERROR');
      expect(exception.message, 'Validation error on $field: $errMsg');
      expect(exception.toString(), contains('ValidatorException: [$field]'));
      expect(exception.props, containsAll([exception.code, exception.message]));
    });
  });

  group('NetworkException', () {
    test('should contain correct message and code via constructor', () {
      const message = 'No Internet';
      const code = 'NO_INTERNET';

      final exception = NetworkException(message: message, code: code);

      expect(exception.message, message);
      expect(exception.code, code);
      expect(exception.props, [code, message]);
    });

    test('should create from map with valid values', () {
      final map = {'message': 'Timeout', 'code': 'TIMEOUT'};

      final exception = NetworkException.fromMap(map);

      expect(exception.message, 'Timeout');
      expect(exception.code, 'TIMEOUT');
    });

    test('should fallback to default values from map when missing fields', () {
      final exception = NetworkException.fromMap({});

      expect(exception.message, 'An unknown network error occurred.');
      expect(exception.code, 'NETWORK_ERROR');
    });

    test('should support equality', () {
      final e1 = NetworkException(message: 'Lost', code: 'X');
      final e2 = NetworkException(message: 'Lost', code: 'X');
      final e3 = NetworkException(message: 'Other', code: 'Y');

      expect(e1, equals(e2));
      expect(e1 == e3, isFalse);
    });
  });

  group('BaseException equality & props', () {
    test('should support value comparison', () {
      final e1 = _FakeException(code: 'X001', message: 'Oops');
      final e2 = _FakeException(code: 'X001', message: 'Oops');

      expect(e1, equals(e2));
      expect(e1.props, ['X001', 'Oops']);
    });
  });
}

class _FakeException extends BaseException {
  const _FakeException({required super.code, required super.message});
}
