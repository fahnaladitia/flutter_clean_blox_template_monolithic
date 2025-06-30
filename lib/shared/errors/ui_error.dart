part of 'errors.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

sealed class UIError extends Equatable {
  final String message;
  final String code;

  const UIError({required this.message, required this.code});

  @override
  List<Object> get props => [message, code];

  @override
  bool get stringify => true;

  ValidationUIError? get validationUIError =>
      this is ValidationUIError ? this as ValidationUIError : null;

  MessageUIError? get messageUIError =>
      this is MessageUIError ? this as MessageUIError : null;
}
