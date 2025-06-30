part of '../utils.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

class BaseException extends Equatable implements Exception {
  final String code;
  final String message;

  const BaseException({required this.code, required this.message});

  @override
  List<Object?> get props => [code, message];

  @override
  bool get stringify => true;
}
