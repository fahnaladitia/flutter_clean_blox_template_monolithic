import 'package:flutter_clean_blox_template/core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_blox_template/shared/shared.dart';

final class SignInUsecaseParam extends Equatable {
  final String email;
  final String password;

  const SignInUsecaseParam({required this.email, required this.password});

  @override
  String toString() {
    return 'SignInUsecaseParam(email: $email, password: $password)';
  }

  void validate() {
    List<ValidatorFieldException> errors = [];
    if (email.isEmpty) {
      errors.add(
        ValidatorFieldException(
          fieldName: 'email',
          message: 'Email cannot be empty',
        ),
      );
    }
    if (password.isEmpty) {
      errors.add(
        ValidatorFieldException(
          fieldName: 'password',
          message: 'Password cannot be empty',
        ),
      );
    }

    final emailValidation = ValidatorUtils.validateEmail(email);
    if (emailValidation != null) {
      errors.add(
        ValidatorFieldException(fieldName: 'email', message: emailValidation),
      );
    }

    final passwordValidation = ValidatorUtils.validatePassword(password);
    if (passwordValidation != null) {
      errors.add(
        ValidatorFieldException(
          fieldName: 'password',
          message: passwordValidation,
        ),
      );
    }

    if (errors.isNotEmpty) {
      throw ValidationException(errors: errors);
    }
  }

  @override
  List<Object> get props => [email, password];
}
