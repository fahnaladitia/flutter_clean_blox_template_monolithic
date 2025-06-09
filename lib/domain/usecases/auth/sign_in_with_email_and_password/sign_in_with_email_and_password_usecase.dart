import 'package:flutter_clean_blox_template/core/common/exceptions/validator_exception.dart';
import 'package:flutter_clean_blox_template/core/common/usecases/usecases.dart';
import 'package:flutter_clean_blox_template/core/utils/validators.dart';
import 'package:flutter_clean_blox_template/domain/models/sign_in_request.dart';
import 'package:flutter_clean_blox_template/domain/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';

part 'sign_in_with_email_and_password_param.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

class SignInWithEmailAndPasswordUsecase
    extends UsecaseWithParam<void, SignInWithEmailAndPasswordParam> {
  final IAuthRepository _authRepository;

  SignInWithEmailAndPasswordUsecase(this._authRepository);

  @override
  Future<void> call(SignInWithEmailAndPasswordParam param) async {
    final SignInRequest signInRequest = SignInRequest(
      email: param.email,
      password: param.password,
    );

    return await _authRepository.signInWithEmailAndPassword(signInRequest);
  }
}
