import 'package:flutter_clean_blox_template/core/common/usecases/usecases.dart';
import 'package:flutter_clean_blox_template/domain/repositories/auth_repository.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

class IsSignedInUsecase extends Usecase<bool> {
  final IAuthRepository _authRepository;

  IsSignedInUsecase(this._authRepository);

  @override
  Future<bool> call() async {
    return await _authRepository.isSignedIn();
  }
}
