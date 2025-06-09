import 'package:equatable/equatable.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

abstract class UIError extends Equatable {
  final String message;
  final String code;

  const UIError({required this.message, required this.code});

  @override
  List<Object> get props => [message, code];

  @override
  bool get stringify => true;
}

class ValidatorUIError extends UIError {
  final String fieldName;

  const ValidatorUIError({
    required this.fieldName,
    required super.message,
    required super.code,
  });

  @override
  List<Object> get props => [fieldName, message, code];
}

class ToasterUIError extends UIError {
  const ToasterUIError({required super.message, required super.code});
}

class DialogUIError extends UIError {
  final String title;

  const DialogUIError({
    required this.title,
    required super.message,
    required super.code,
  });

  @override
  List<Object> get props => [title, message, code];

  @override
  bool get stringify => true;
}

class CustomUIError extends UIError {
  const CustomUIError({required super.message, required super.code});
}
