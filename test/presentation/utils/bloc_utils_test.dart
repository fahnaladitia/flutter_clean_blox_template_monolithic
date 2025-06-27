import 'package:dio/dio.dart';
import 'package:flutter_clean_blox_template/core/common/exceptions/base_exception.dart';
import 'package:flutter_clean_blox_template/core/common/exceptions/cache_exception.dart';
import 'package:flutter_clean_blox_template/core/common/exceptions/network_exception.dart';
import 'package:flutter_clean_blox_template/core/common/exceptions/validator_exception.dart';
import 'package:flutter_clean_blox_template/presentation/utils/bloc_utils.dart';
import 'package:flutter_clean_blox_template/presentation/utils/ui_error.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('runBlocExecutor', () {
    test('executes logic without error', () async {
      var initialCalled = false;
      var logicCalled = false;
      UIError? capturedError;

      await runBlocExecutor(
        onInitialBuilder: () => initialCalled = true,
        onLogicBuilder: () {
          logicCalled = true;
        },
        onErrorBuilder: (error) => capturedError = error,
      );

      expect(initialCalled, isTrue);
      expect(logicCalled, isTrue);
      expect(capturedError, isNull);
    });

    test('handles CacheException correctly', () async {
      UIError? capturedError;

      await runBlocExecutor(
        onInitialBuilder: () {},
        onLogicBuilder: () {
          throw CacheException(cause: 'disk read failure');
        },
        onErrorBuilder: (error) => capturedError = error,
      );

      expect(capturedError, isA<MessageUIError>());
      expect(
        capturedError?.message,
        'An error occurred while accessing the cache: disk read failure, please try again later. see logs for more details.',
      );
      expect(capturedError?.code, 'CACHE_ERROR');
    });

    test('handles NetworkException correctly (via DioException)', () async {
      UIError? capturedError;

      await runBlocExecutor(
        onInitialBuilder: () {},
        onLogicBuilder: () {
          throw DioException(
            requestOptions: RequestOptions(path: '/your-endpoint'),
            message: 'Something went wrong',
            error: NetworkException(message: 'Network fail', code: 'NET_ERR'),
            type: DioExceptionType.connectionTimeout,
          );
        },
        onErrorBuilder: (error) => capturedError = error,
      );

      expect(capturedError, isA<MessageUIError>());
      expect(capturedError?.message, 'Network fail');
      expect(capturedError?.code, 'NET_ERR');
    });

    test('handles ValidatorException correctly', () async {
      UIError? capturedError;

      await runBlocExecutor(
        onInitialBuilder: () {},
        onLogicBuilder: () {
          throw ValidatorException(
            errMessage: 'Invalid field',
            fieldName: 'email',
          );
        },
        onErrorBuilder: (error) => capturedError = error,
      );

      expect(capturedError, isA<ValidatorUIError>());
      final validatorError = capturedError as ValidatorUIError;
      expect(
        validatorError.message,
        "Validation error on email: Invalid field",
      );
      expect(validatorError.code, 'VALIDATION_ERROR');
      expect(validatorError.fieldName, 'email');
    });

    test('handles unknown DioException', () async {
      UIError? capturedError;

      await runBlocExecutor(
        onInitialBuilder: () {},
        onLogicBuilder: () {
          throw DioException(
            requestOptions: RequestOptions(path: '/'),
            message: 'No connection',
            type: DioExceptionType.unknown,
          );
        },
        onErrorBuilder: (error) => capturedError = error,
      );

      expect(capturedError, isA<MessageUIError>());
      expect(capturedError?.message, contains('No connection'));
    });

    test('handles unknown BaseException', () async {
      UIError? capturedError;

      await runBlocExecutor(
        onInitialBuilder: () {},
        onLogicBuilder: () {
          throw const BaseException(
            message: 'Base unknown',
            code: 'BASE_UNKNOWN',
          );
        },
        onErrorBuilder: (error) => capturedError = error,
      );

      expect(capturedError, isA<MessageUIError>());
      expect(capturedError?.message, 'Base unknown');
    });

    test('handles unexpected exception', () async {
      UIError? capturedError;

      await runBlocExecutor(
        onInitialBuilder: () {},
        onLogicBuilder: () {
          throw Exception('Unexpected error!');
        },
        onErrorBuilder: (error) => capturedError = error,
      );

      expect(capturedError, isA<MessageUIError>());
      expect(capturedError?.message, contains('Unexpected error!'));
      expect(capturedError?.code, 'UNEXPECTED_ERROR');
    });
  });
}
