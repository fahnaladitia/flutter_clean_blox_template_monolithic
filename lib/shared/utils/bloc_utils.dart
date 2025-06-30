part of 'utils.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

typedef BlocLogic<T> = FutureOr<void> Function();
typedef BlocErrorHandler = void Function(UIError error);
typedef BlocInitialState = void Function()?;

class BlocUtils {
  BlocUtils._();

  static void runSimpleBlocObserver() {
    Bloc.observer = SimpleBlocObserver();
  }

  static FutureOr<void> runBlocExecutor({
    required BlocInitialState onInitialBuilder,
    required BlocLogic onLogicBuilder,
    required BlocErrorHandler onErrorBuilder,
  }) async {
    // Emit the initial state
    onInitialBuilder?.call();
    try {
      await onLogicBuilder();
    } on DioException catch (e) {
      if (e.error is BaseException) {
        final baseException = e.error as BaseException;

        switch (baseException.runtimeType) {
          case const (CacheException):
            _handleCacheException(
              baseException as CacheException,
              onErrorBuilder,
            );
            return;
          case const (NetworkException):
            _handleNetworkException(
              baseException as NetworkException,
              onErrorBuilder,
            );
            return;
          case const (ValidationException):
            _handleValidationException(
              baseException as ValidationException,
              onErrorBuilder,
            );
            return;
          default:
            _handleBaseException(baseException, onErrorBuilder);
            return;
        }
      }
      final error = MessageUIError(
        message: e.message ?? 'An error occurred: ${e.toString()}',
        code: e.type.toString(),
      );
      onErrorBuilder(error);
    } on BaseException catch (e) {
      if (e is CacheException) {
        _handleCacheException(e, onErrorBuilder);
        return;
      }
      if (e is ValidationException) {
        _handleValidationException(e, onErrorBuilder);
        return;
      }

      if (e is NetworkException) {
        _handleNetworkException(e, onErrorBuilder);
        return;
      }

      _handleBaseException(e, onErrorBuilder);
    } catch (e) {
      // Handle any other unexpected exceptions
      final error = MessageUIError(
        message: 'An unexpected error occurred: ${e.toString()}',
        code: 'UNEXPECTED_ERROR',
      );
      onErrorBuilder(error);
    }
  }

  static void _handleNetworkException(
    NetworkException networkException,
    void Function(UIError error) onErrorStateBuilder,
  ) {
    final message = networkException.message;
    final code = networkException.code;
    onErrorStateBuilder(MessageUIError(message: message, code: code));
  }

  static void _handleCacheException(
    CacheException e,
    void Function(UIError error) onErrorStateBuilder,
  ) {
    onErrorStateBuilder(MessageUIError(message: e.message, code: e.code));
  }

  static void _handleBaseException(
    BaseException e,
    void Function(UIError error) onErrorStateBuilder,
  ) {
    final message = e.message;
    final code = e.code;
    onErrorStateBuilder(MessageUIError(message: message, code: code));
  }

  static void _handleValidationException(
    ValidationException e,
    void Function(UIError error) onErrorStateBuilder,
  ) {
    onErrorStateBuilder(
      ValidationUIError(
        message: e.message,
        code: e.code,
        errors: e.validatorFields,
      ),
    );
  }
}
