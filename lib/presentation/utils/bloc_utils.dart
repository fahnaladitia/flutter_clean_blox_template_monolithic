import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_clean_blox_template/core/common/exceptions/base_exception.dart';
import 'package:flutter_clean_blox_template/core/common/exceptions/cache_exception.dart';
import 'package:flutter_clean_blox_template/core/common/exceptions/network_exception.dart';
import 'package:flutter_clean_blox_template/core/common/exceptions/validator_exception.dart';
import 'package:flutter_clean_blox_template/presentation/utils/ui_error.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

typedef BlocLogic<T> = FutureOr<void> Function();
typedef BlocErrorHandler = void Function(UIError error);
typedef BlocInitialState = void Function()?;

FutureOr<void> runBlocExecutor({
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
        case const (ValidatorException):
          _handleValidatorException(
            baseException as ValidatorException,
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
    if (e is ValidatorException) {
      _handleValidatorException(e, onErrorBuilder);
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

void _handleNetworkException(
  NetworkException networkException,
  void Function(UIError error) onErrorStateBuilder,
) {
  final message = networkException.message;
  final code = networkException.code;
  onErrorStateBuilder(MessageUIError(message: message, code: code));
}

void _handleCacheException(
  CacheException e,
  void Function(UIError error) onErrorStateBuilder,
) {
  onErrorStateBuilder(MessageUIError(message: e.message, code: e.code));
}

void _handleBaseException(
  BaseException e,
  void Function(UIError error) onErrorStateBuilder,
) {
  final message = e.message;
  final code = e.code;
  onErrorStateBuilder(MessageUIError(message: message, code: code));
}

void _handleValidatorException(
  ValidatorException e,
  void Function(UIError error) onErrorStateBuilder,
) {
  final fieldName = e.fieldName;
  final code = e.code;
  onErrorStateBuilder(
    ValidatorUIError(message: e.message, fieldName: fieldName, code: code),
  );
}
