import 'package:flutter_clean_blox_template/core/common/usecases/usecases.dart';
import 'package:flutter_clean_blox_template/domain/repositories/auth_repository.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

class SignOutUsecase extends Usecase<void> {
  final IAuthRepository _authRepository;

  SignOutUsecase(this._authRepository);

  @override
  Future<void> call() async => await _authRepository.signOut();
}
