part of 'sign_in_with_email_and_password_usecase.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

class SignInWithEmailAndPasswordParam extends Equatable {
  final String email;
  final String password;

  SignInWithEmailAndPasswordParam({
    required this.email,
    required this.password,
  }) {
    validate();
  }

  void validate() {
    final emailError = Validators.validateEmail(email);
    if (emailError != null) {
      throw ValidatorException(fieldName: 'email', errMessage: emailError);
    }

    final passwordError = Validators.validatePassword(password);
    if (passwordError != null) {
      throw ValidatorException(
        fieldName: 'password',
        errMessage: passwordError,
      );
    }
  }

  @override
  List<Object> get props => [email, password];

  @override
  bool get stringify => true;
}
