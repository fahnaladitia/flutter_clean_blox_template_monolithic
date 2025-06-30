import 'package:flutter_clean_blox_template/core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_clean_blox_template/shared/shared.dart';

void main() {
  group('BlocUtils.runBlocExecutor', () {
    test('should execute onLogicBuilder successfully', () async {
      String? result;
      await BlocUtils.runBlocExecutor(
        onInitialBuilder: () {},
        onLogicBuilder: () async {
          result = 'OK';
        },
        onErrorBuilder: (_) {
          result = 'ERROR';
        },
      );

      expect(result, equals('OK'));
    });

    test(
      'should catch CacheException and call onErrorBuilder with MessageUIError',
      () async {
        UIError? errorResult;
        final exception = CacheException(cause: 'Cache failure');

        await BlocUtils.runBlocExecutor(
          onInitialBuilder: () {},
          onLogicBuilder: () {
            throw exception;
          },
          onErrorBuilder: (error) => errorResult = error,
        );

        expect(errorResult, isA<MessageUIError>());
        expect(
          (errorResult as MessageUIError).message,
          equals(exception.message),
        );
      },
    );

    test('should catch unknown error and return UNEXPECTED_ERROR', () async {
      UIError? errorResult;

      await BlocUtils.runBlocExecutor(
        onInitialBuilder: () {},
        onLogicBuilder: () {
          throw Exception('unknown');
        },
        onErrorBuilder: (error) => errorResult = error,
      );

      expect(errorResult, isA<MessageUIError>());
      expect((errorResult as MessageUIError).code, equals('UNEXPECTED_ERROR'));
    });
  });
}
