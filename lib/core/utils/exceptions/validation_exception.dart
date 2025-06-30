part of '../utils.dart';

class ValidatorFieldException {
  final String fieldName;
  final String message;
  const ValidatorFieldException({
    required this.fieldName,
    required this.message,
  });

  @override
  String toString() {
    return 'ValidatorFieldException: [$fieldName], Error: $message';
  }
}

class ValidationException extends BaseException {
  final List<ValidatorFieldException> errors;

  const ValidationException({required this.errors})
    : super(message: 'Validation failed', code: 'VALIDATION_ERROR');

  @override
  String toString() {
    return 'ValidationException: ${errors.map((e) => e.toString()).join(', ')}';
  }
}
