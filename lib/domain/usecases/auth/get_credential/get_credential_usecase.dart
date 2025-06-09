import 'package:flutter_clean_blox_template/core/common/usecases/usecases.dart';
import 'package:flutter_clean_blox_template/domain/models/credential.dart';
import 'package:flutter_clean_blox_template/domain/repositories/auth_repository.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

class GetCredentialUsecase extends Usecase<Credential?> {
  final IAuthRepository _authRepository;

  GetCredentialUsecase(this._authRepository);

  @override
  Future<Credential?> call() async {
    final credential = await _authRepository.getCredential();
    return credential;
  }
}
