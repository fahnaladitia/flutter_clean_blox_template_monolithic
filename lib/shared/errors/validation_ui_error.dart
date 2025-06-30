part of 'errors.dart';

class ValidationUIError extends UIError {
  final List<ValidatorField> errors;

  const ValidationUIError({
    required this.errors,
    required super.message,
    required super.code,
  });

  @override
  List<Object> get props => [errors, message, code];

  @override
  String toString() {
    return 'ValidationUIError(errors: $errors, message: $message, code: $code)';
  }
}

class ValidatorField extends Equatable {
  final String fieldName;
  final String message;

  const ValidatorField({required this.fieldName, required this.message});

  String get fieldError => '$fieldName: $message';

  @override
  List<Object> get props => [fieldName, message];

  @override
  String toString() {
    return 'ValidatorField(fieldName: $fieldName, message: $message)';
  }
}

extension ValidationExceptionExt on ValidationException {
  List<ValidatorField> get validatorFields => errors.map((error) {
    return ValidatorField(fieldName: error.fieldName, message: error.message);
  }).toList();
}
