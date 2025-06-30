import 'package:flutter_clean_blox_template/core/core.dart';
import 'package:flutter_clean_blox_template/features/auth/domain/repositories/auth_repository.dart';

import 'sign_up_usecase_param.dart';

class SignUpUsecase implements UsecaseWithParam<void, SignUpUsecaseParam> {
  final AuthRepository repository;

  SignUpUsecase({required this.repository});
  @override
  Future<void> call(SignUpUsecaseParam param) async {
    param.validate();
    // Checking if the user is authenticated
    // If the user is authenticated, we retrieve the access token
    final isAuthenticated = await repository.isAuthenticated();
    if (isAuthenticated) {
      // Authenticated users should not be able to sign in again
      throw BaseException(
        code: 'ALREADY_AUTHENTICATED',
        message: 'User is already authenticated. Please sign out first.',
      );
    }

    // If the user is not authenticated, we proceed with the sign-in process
    final result = await repository.signUp(
      name: param.name,
      email: param.email,
      password: param.password,
    );

    // Saving the authentication data
    await repository.saveAuth(result);
  }
}
