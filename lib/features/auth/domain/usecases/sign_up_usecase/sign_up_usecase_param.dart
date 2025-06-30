import 'package:flutter_clean_blox_template/core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_blox_template/shared/shared.dart';

final class SignUpUsecaseParam extends Equatable {
  final String email;
  final String password;
  final String confirmPassword;
  final String name;

  const SignUpUsecaseParam({
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.name,
  });

  @override
  List<Object> get props => [email, password, confirmPassword, name];

  @override
  String toString() {
    return 'SignUpUsecaseParam(email: $email, password: $password, confirmPassword: $confirmPassword, name: $name)';
  }

  void validate() {
    List<ValidatorFieldException> errors = [];
    // Check if name is not empty
    if (name.isEmpty) {
      errors.add(
        ValidatorFieldException(
          fieldName: 'name',
          message: 'Name cannot be empty',
        ),
      );
    }

    // Check if email, password, and confirmPassword are not empty
    if (email.isEmpty) {
      errors.add(
        ValidatorFieldException(
          fieldName: 'email',
          message: 'Email cannot be empty',
        ),
      );
    }

    // Check if password and confirmPassword are not empty
    if (password.isEmpty) {
      errors.add(
        ValidatorFieldException(
          fieldName: 'password',
          message: 'Password cannot be empty',
        ),
      );
    }

    // Validate email
    final emailValidation = ValidatorUtils.validateEmail(email);
    if (emailValidation != null) {
      errors.add(
        ValidatorFieldException(fieldName: 'email', message: emailValidation),
      );
    }

    // Validate password
    final passwordValidation = ValidatorUtils.validatePassword(password);
    if (passwordValidation != null) {
      errors.add(
        ValidatorFieldException(
          fieldName: 'password',
          message: passwordValidation,
        ),
      );
    }

    // Validate confirmPassword
    final confirmPasswordValidation =
        ValidatorUtils.validatePasswordConfirmation(password, confirmPassword);
    if (confirmPasswordValidation != null) {
      errors.add(
        ValidatorFieldException(
          fieldName: 'confirm_password',
          message: confirmPasswordValidation,
        ),
      );
    }

    if (errors.isNotEmpty) {
      throw ValidationException(errors: errors);
    }
  }
}
